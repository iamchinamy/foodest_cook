class Recipe < ApplicationRecord

	attachment :recipe_image

	belongs_to :producer

end
