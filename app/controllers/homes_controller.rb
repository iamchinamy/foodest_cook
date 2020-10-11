class HomesController < ApplicationController

	def top
		@random = Producer.order("RANDOM()").limit(3)
		@all_ranks = Recipe.create_all_ranks
	end


end
