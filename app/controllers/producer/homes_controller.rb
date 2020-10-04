class Producer::HomesController < ApplicationController

	def my_page
		@producer = current_producer
		@recipes = @producer.recipes
		# @recipes = 投稿者のレシピだけ表示
	end

end
