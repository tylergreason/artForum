# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all 
Image.destroy_all
Comment.destroy_all

require 'faker'

10.times do 
    User.create(first_name: Faker::Name.name, last_name: Faker::Name.name, email: Faker::Internet.email, location: Faker::Address.city, biography: Faker::Lorem.sentence(word_count: 30))
end

10.times do
    Image.create(url: "https://lh3.googleusercontent.com/proxy/v_X7LeUVFzRQBnAYqvOSPsuQJGBuxA2zsDe02kMTDfbfaEjmI9Ge_7xC5SHba8qPfKhLv2GbpHeQKm1obQmNdG5_Yzen3g5Ovc6O1_KB8AycErk-iOHIi02_DhP_kQ", metro_link: "https://www.metmuseum.org/", artist: Faker::Name.name, date_created: Faker::Date.backward(days: 10000),title: Faker::Superhero.name)
end

# give each user multiple comments 
User.all.each do |user| 
    5.times do 
        Comment.create(user: user, image: Image.all.sample, text: Faker::Lorem.sentence(word_count: 30))
    end
end
