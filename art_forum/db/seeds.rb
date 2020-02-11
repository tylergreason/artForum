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
require 'rest-client'
require 'json'


10.times do 
    User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, location: Faker::Address.city, biography: Faker::Lorem.sentence(word_count: 30))
end

# get museum url for pieces with images 
url = 'https://collectionapi.metmuseum.org/public/collection/v1/search?q=hasImage=true'
# create rest response for it 
response = RestClient.get(url)
# turn that into JSON
images = JSON.parse(response)
5.times do
    Image.create_image
    # # get a random image id
    # random_image_id = images['objectIDs'].sample
    # # get the data for one image 
    # image_data = JSON.parse(RestClient.get("https://collectionapi.metmuseum.org/public/collection/v1/objects/#{random_image_id}"))

    # new_image = Image.new(
    #     url: image_data["primaryImageSmall"],
    #     metro_link: image_data["objectURL"],
    #     artist: image_data["artistDisplayName"], 
    #     date_created: image_data["objectDate"],
    #     title: image_data["title"]
    # )
    # if new_image.valid?
    #      p "image was valid!"
    #     new_image.save 
    # else
    #     p "image was not valid!"
    #     image_data = JSON.parse(RestClient.get("https://collectionapi.metmuseum.org/public/collection/v1/objects/#{random_image_id}"))

    #     new_image = Image.new(
    #         url: image_data["primaryImageSmall"],
    #         metro_link: image_data["objectURL"],
    #         artist: image_data["artistDisplayName"], 
    #         date_created: image_data["objectDate"],
    #         title: image_data["title"]
    #     )   
    # end


    # pp new_image


    # Image.create(url: "https://lh3.googleusercontent.com/proxy/v_X7LeUVFzRQBnAYqvOSPsuQJGBuxA2zsDe02kMTDfbfaEjmI9Ge_7xC5SHba8qPfKhLv2GbpHeQKm1obQmNdG5_Yzen3g5Ovc6O1_KB8AycErk-iOHIi02_DhP_kQ", metro_link: "https://www.metmuseum.org/", artist: Faker::Name.name, date_created: Faker::Date.backward(days: 10000),title: Faker::Superhero.name)
end

# give each user multiple comments 
User.all.each do |user| 
    5.times do 
        Comment.create(user: user, image: Image.all.sample, text: Faker::Lorem.sentence(word_count: 30))
    end
end
