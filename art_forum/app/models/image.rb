class Image < ApplicationRecord
    
    # associations 
    has_many :comments 
    has_many :users, through: :comments 
    
    # validations
    validates :url, :metro_link, :artist, :date_created, :title, presence: true 
    
    # rest variables 
    @@metro_url ||= 'https://collectionapi.metmuseum.org/public/collection/v1/search?q=hasImage=true'
    # create rest response for it 
    @@metro_response ||= RestClient.get(@@metro_url)
    # turn that into JSON
    @@metro_images ||= JSON.parse(@@metro_response)

    # create a new image instance using the metro api 
    def self.create_image 
        # get a random image id
        random_image_id = @@metro_images['objectIDs'].sample
        # get the data for one image 
        image_data = JSON.parse(RestClient.get("https://collectionapi.metmuseum.org/public/collection/v1/objects/#{random_image_id}"))
        new_image = Image.new(
            url: image_data["primaryImageSmall"],
            metro_link: image_data["objectURL"],
            artist: image_data["artistDisplayName"], 
            date_created: image_data["objectDate"],
            title: image_data["title"]
        )
        # if the new image isn't valid, make another one. Repeat until a valid image is made. 
        if new_image.valid? 
            new_image.save 
            p "the image was valid!"
        else
            p "The image was not valid!"
            self.create_image
        end
    end

    # check if the most recent image is today's image and if not, create a new one for today. This method should run whenever the Image index page is loaded. 
    def self.todays_image 
        last_image_date = self.sort_by_creation_date.first.created_at 
        today = DateTime.now 
        if last_image_date.year == today.year &&  last_image_date.month == today.month && last_image_date.day == today.day 
            p 'an image has already been generated for today'
        else
            self.create_image
        end
    end


    # print date in readable format
    def image_date 
        self.created_at.strftime("%B %d, %Y")
    end

    # sort all images by the date they were made 
    def self.sort_by_creation_date 
        # the last item in this list is the most recent image 
        self.all.sort_by {|image| image.created_at}.reverse
    end
end
