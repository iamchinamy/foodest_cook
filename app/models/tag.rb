class Tag < ApplicationRecord
	belongs_to :recipe

	def self.create_tag_by_vision_api(recipe, tags)
		tags.each do |tag|
  			recipe.tags.create(name: tag)
		end
	end
end
