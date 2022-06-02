require 'faker'
require 'json'

#json files
filepath = "db/activities.json"
activities_serialized = File.read(filepath)
activities = JSON.parse(activities_serialized)

file_user = "db/users.json"
users_serialized = File.read(file_user)
users = JSON.parse(users_serialized)

#Clearing database
puts "clearing database"
Activity.destroy_all
User.destroy_all

#Creating database
puts "creating activity"
i = 0
user1 = User.create(email: "#{users["entries"][i]["email"]}", password: "#{users["entries"][i]["password"]}")

photo = activities["entries"][i]["photo"]
file = URI.open("#{photo}")
Activity.create!(title: "#{activities["entries"][i]["title"]}", details: "#{activities["entries"][i]["details"]}", address: "#{activities["entries"][i]["address"]}", price: "#{activities["entries"][i]["price"]}", category: "#{activities["entries"][i]["category"]}",user_id: "#{user1.id}").photos.attach(io: file, filename: 'activity.jpg', content_type: 'image/jpg')

#This code allows us to just insert new entries in the json files without bothering with changing the number of the times the loop needs to repeat itself
count = "#{activities["entries"].count - 1}".to_i
count.times do
  i += 1
  user1 = User.create(email: "#{users["entries"][i]["email"]}", password: "#{users["entries"][i]["password"]}")
  photo = activities["entries"][i]["photo"]
  file = URI.open("#{photo}")
  Activity.create!(title: "#{activities["entries"][i]["title"]}", details: "#{activities["entries"][i]["details"]}", address: "#{activities["entries"][i]["address"]}", price: "#{activities["entries"][i]["price"]}",category: "#{activities["entries"][i]["category"]}", user_id: "#{user1.id}").photos.attach(io: file, filename: "activity.jpg", content_type: 'image/jpg')
end

puts "activities created"
