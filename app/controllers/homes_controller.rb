class HomesController < ApplicationController

	def top
		@random = Producer.order("RANDOM()").limit(3)
	end


end
