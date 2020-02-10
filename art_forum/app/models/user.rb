class User < ApplicationRecord
    has_many :comments 
    has_many :images, through: :comments 

    validates :first_name, :last_name, :email, :location, :biography, presence: true 
    validates :biography, length: {maximum: 250}
    validates :email, uniqueness: true 

    def full_name 
        self.first_name + " " + self.last_name 
    end
end
