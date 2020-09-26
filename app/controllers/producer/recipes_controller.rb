class Producer::RecipesController < ApplicationController

	before_action :authenticate_producer!

	def index
		@recipes = Recipe.all
	end

	def show
		@recipe = Recipe.find(params:[:id])
	end

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.new(recipe_params)
		#if文追加する
		@recipe.save
	end

	def show
		@recipe = Recipe.find(params[:id])
	end

	def update
		@recipe = Recipe.find(params[:id])
		@recipe.update(recipe_params)
		#redirect_to
	end

private
	def recipe_params
		params.require(:recipe).permit(:title, :description, :total_time, :recipe_image, :producer_id)
	end

end
