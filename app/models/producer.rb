class Producer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :producer_image
  
  has_many :recipes, dependent: :destroy
  
  has_many :likes, dependent: :destroy
  has_many :liked_recipes, through: :likes, source: :recipe
  
  validates :corporate_name, length: {maximum: 20, minimum: 2}
  validates :representative, length: {maximum: 20, minimum: 2}
  validates :post_code, length: {is: 7}
  validates :address, presence: true
  validates :phone_number, presence: true, length: { in: 10..11 }


end
