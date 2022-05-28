require 'faker'
require 'json'

filepath = "db/activities.json"
activities_serialized = File.read(filepath)
activities = JSON.parse(activities_serialized)

puts "clearing database"
Activity.destroy_all
User.destroy_all
puts "creating activity"
i = 0

user1 = User.create(email: "mail@yahoo.com", password: "123456")
user2 = User.create(email: "mail@hotmail.org", password: "1234567")
user3 = User.create(email: "mail@google.com", password: "12345678")
user4 = User.create(email: "mail@wazza.org", password: "123456789")
user5 = User.create(email: "mail12@yahoo.com", password: "1234567891")
user6 = User.create(email: "mail5@hotmail.org", password: "12345678912")

user = [user1, user2, user3, user4, user5, user6].sample
Activity.create!(title: "#{activities["entries"][0]["title"]}", details: "#{activities["entries"][0]["details"]}", address: "#{activities["entries"][0]["address"]}", price: "#{activities["entries"][0]["price"]}", user_id: "#{user.id}", photo: "#{activities["entries"][0]["photo"]}")

5.times do
  i += 1
  user = [user1, user2, user3, user4, user5, user6].sample
  Activity.create!(title: "#{activities["entries"][i]["title"]}", details: "#{activities["entries"][i]["details"]}", address: "#{activities["entries"][i]["address"]}", price: "#{activities["entries"][i]["price"]}", user_id: "#{user.id}", photo: "#{activities["entries"][i]["photo"]}")
end

puts "activities created"
