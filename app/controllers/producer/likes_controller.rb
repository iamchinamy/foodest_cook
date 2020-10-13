class Producer::LikesController < ApplicationController
	before_action :authenticate_producer!
	
	def create
		@recipe = Recipe.find(params[:recipe_id])
		@like = current_producer.likes.build(recipe_id: params[:recipe_id])
		@like.save
	end

	def destroy
		@recipe = Recipe.find(params[:recipe_id])
		@like = Like.find_by(recipe_id: params[:recipe_id], producer_id: current_producer.id)
		@like.destroy
	end
end
