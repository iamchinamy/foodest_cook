class Producer::LikesController < ApplicationController
	def create
		recipe = Recipe.find(params[:recipe_id])
		@like = current_producer.likes.build(recipe_id: params[:recipe_id])
		@like.save
		redirect_to producer_recipe_path(recipe)
	end

	def destroy
		recipe = Recipe.find(params[:recipe_id])
		@like = Like.find_by(recipe_id: params[:recipe_id], producer_id: current_producer.id)
		@like.destroy
		redirect_to producer_recipe_path(recipe)
	end
end
