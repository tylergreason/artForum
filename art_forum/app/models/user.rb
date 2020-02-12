class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :location, :biography, presence: true
  validates :location, :first_name, :last_name, length: {maximum: 20}
  validates :biography, length: {maximum: 250}

  # associations 
  has_many :comments 
  has_many :images, through: :comments 

  # instance methods 
  def full_name 
      self.first_name.capitalize + " " + self.last_name.capitalize
  end

end
