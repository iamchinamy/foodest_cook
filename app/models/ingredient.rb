class Ingredient < ApplicationRecord

	belongs_to :recipe

	validates :item, presence: true
	validates :amount, presence: true

end
