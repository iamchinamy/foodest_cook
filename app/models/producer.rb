class Producer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :producer_image
  
  has_many :recipes, dependent: :destroy
  
  has_many :likes, dependent: :destroy
  has_many :liked_recipes, through: :likes, source: :recipe
  


end
