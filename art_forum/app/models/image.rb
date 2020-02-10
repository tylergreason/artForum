class Image < ApplicationRecord
    has_many :comments 
    has_many :users, through: :comments 

    validates :url, :metro_link, :artist, :date_created, :title, presence: true 

    # print date in readable format
    def image_date 
        self.created_at.strftime("%B %d, %Y")
    end

    #define method for creating random dates. From: 
    # https://stackoverflow.com/questions/4894198/how-to-generate-a-random-date-in-ruby
    def self.random_time from = 0.0, to = Time.now
            Time.at(from + rand * (to.to_f - from.to_f))
    end

    # sort all images by the date they were made 
    def self.sort_by_creation_date 
        self.all.sort_by{|image| image.created_at}
    end
end
