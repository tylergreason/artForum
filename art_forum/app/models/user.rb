class User < ApplicationRecord
    has_many :comments 
    has_many :images, through: :comments 

    def full_name 
        self.first_name + " " + self.last_name 
    end
end
