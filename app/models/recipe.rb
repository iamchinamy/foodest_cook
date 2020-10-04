class Recipe < ApplicationRecord

	attachment :recipe_image

	belongs_to :producer

	# レシピに紐づくproducerの定義
	def producer
		return Producer.find_by(id: self.producer_id)
	end

end
