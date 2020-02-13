# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all 
# Image.destroy_all
Comment.destroy_all

require 'faker'
require 'rest-client'
require 'json'


20.times do 
    a = User.new(
        email: Faker::Internet.email, 
        password: "password", 
        password_confirmation: "password", 
        first_name: Faker::Name.first_name, 
        last_name: Faker::Name.last_name, 
        location: Faker::Address.city, 
        biography: Faker::Lorem.sentence(word_count: 30)
    )
    if a.valid? 
        a.save
        p "the user is valid "
    else
        p "the user is not valid "
    end
end

# get museum url for pieces with images 
url = 'https://collectionapi.metmuseum.org/public/collection/v1/search?q=hasImage=true'
# create rest response for it 
response = RestClient.get(url)
# turn that into JSON
images = JSON.parse(response)
10.times do
    Image.create_image
end

# give each user multiple comments 
User.all.each do |user| 
    10.times do 
        Comment.create(user: user, image: Image.all.sample, text: Faker::Lorem.sentence(word_count: 30))
        Favorite.create(user: user, image: Image.all.sample)
    end
end
