require 'faker'
require 'json'

# json files
filepath = "db/activities.json"
activities_serialized = File.read(filepath)
activities = JSON.parse(activities_serialized)

file_user = "db/users.json"
users_serialized = File.read(file_user)
users = JSON.parse(users_serialized)

# Clearing database
puts "clearing database"
Activity.destroy_all
User.destroy_all

# Creating database
# (REFACTORED) This code allows us to just insert new entries in the json files without bothering with changing the number of the times the loop needs to repeat itself
puts "creating activities"
countdown = "#{activities["entries"].count}".to_i
i = 0
countdown.times do
  user1 = User.create(email: "#{users["entries"][i]["email"]}", password: "#{users["entries"][i]["password"]}")
  acti1 = Activity.create!(title: "#{activities["entries"][i]["title"]}", details: "#{activities["entries"][i]["details"]}", address: "#{activities["entries"][i]["address"]}", price: "#{activities["entries"][i]["price"]}",category: "#{activities["entries"][i]["category"]}", user_id: "#{user1.id}")
  j = 0
  countdown2 = "#{activities["entries"][i]["photo"].count}".to_i
  countdown2.times do
    photo = activities["entries"][i]["photo"][j]
    file = URI.open("#{photo}")
    acti1.photos.attach(io: file, filename: "activity.jpg#{j}", content_type: 'image/jpg')
    j += 1
  end
  i += 1
end

puts "activities created"
