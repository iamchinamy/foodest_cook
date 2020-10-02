class Producer::HomesController < ApplicationController

	def my_page
		@producer = current_producer
		@recipes = Recipe.find_by(@producer.id)
		# @recipes = 投稿者のレシピだけ表示
	end

end
