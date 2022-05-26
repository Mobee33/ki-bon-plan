require 'faker'

puts "clearing database"
Activity.destroy_all
User.destroy_all
puts "crreating activity"


  user1 = User.create(email: "mail@yahoo.com", password:"123456")
  user2 = User.create(email: "mail@hotmail.org", password:"1234567")
  user3 = User.create(email: "mail@google.com", password:"12345678")
  user4 = User.create(email: "mail@wazza.org", password:"123456789")
  user5 = User.create(email: "mail12@yahoo.com", password:"1234567891")
  user6 = User.create(email: "mail5@hotmail.org", password:"12345678912")

 6.times do
  user = [user1, user2, user3, user4, user5, user6].sample
  arr = %w(5..10).sample
  Activity.create!(title: Faker::Artist.name, details: Faker::Games::WorldOfWarcraft.quote, address: Faker::Address.street_address, price: rand(50..80), user_id: "#{user.id}", photo: "https://biz30.timedoctor.com/images/2020/09/team-building-activities.jpg") ##DONT TOUCH THIS. CODE WILL BREAK!!!

end
puts "activities created"
