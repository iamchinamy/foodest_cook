class Recipe < ApplicationRecord

	attachment :recipe_image

	belongs_to :producer

	has_many :ingredients, dependent: :destroy
	accepts_nested_attributes_for :ingredients, allow_destroy: true

	has_many :steps, dependent: :destroy
	accepts_nested_attributes_for :steps, allow_destroy: true


end
