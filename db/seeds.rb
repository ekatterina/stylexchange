  require "open-uri"
require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
3.times do
 user = User.new(
  email: Faker::Internet.email,
  password: "123456"
  )
  user.save!
end

10.times do
  item = Item.new(
    title:    Faker::Company.name,
    pickup_location: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    price: rand(100..500),
    color: Faker::Color.color_name,
    category: ["T-shirt", "Skirt", "Trousers", "Jeans"].sample,
    description: Faker::Lorem.sentence(word_count: 15),
    user_id: rand(1..3),
    size: "XL"
  )
  item.save!

  file = URI.open('https://www1.assets-gap.com/webcontent/0018/172/553/cn18172553.jpg')
  item.photo.attach(io: file, filename: 'nes.jpg', content_type: 'image/jpg')
end
