class Image < ApplicationRecord
    has_many :comments 
    has_many :users, through: :comments 


    #define method for creating random dates. From: 
    # https://stackoverflow.com/questions/4894198/how-to-generate-a-random-date-in-ruby
    def self.random_time from = 0.0, to = Time.now
            Time.at(from + rand * (to.to_f - from.to_f))
    end
end
