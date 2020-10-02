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
		@recipe.producer_id = current_producer.id
		if @recipe.save
			redirect_to my_page_producer_homes_path(current_producer.id)
		else
			render "new"
		end
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
