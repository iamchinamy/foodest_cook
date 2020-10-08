class Producer::RecipesController < ApplicationController

	before_action :authenticate_producer!

	def index
		@recipes = Recipe.all
	end

	def show
		@recipe = Recipe.find(params[:id])
		@producer = @recipe.producer
		@ingredients = @recipe.ingredients.all
		@steps = @recipe.steps.all
	end

	def edit
		@recipe = Recipe.find(params[:id])
	end

	def new
		@recipe = Recipe.new
		@recipe.ingredients.build
		@recipe.steps.build
		@recipe.producer_id = current_producer.id
	end

	def create
		@recipe = Recipe.new(recipe_params)
		@recipe.producer_id = current_producer.id
		if @recipe.save
			redirect_to producer_recipe_path(@recipe.id)
		else
			render "new"
		end
	end

	def update
		@recipe = Recipe.find(params[:id])
		if @recipe.update(recipe_params)
			redirect_to producer_recipe_path(@recipe.id)
		else
			flash[:danger] = 'レシピ情報を正しく更新できませんでした。'
			render :edit
		end
	end

private
	def recipe_params
		params.require(:recipe).permit(:title, :description, :total_time, :recipe_image, :producer_id, ingredients_attributes:[:item, :amount, :recipe_id], steps_attributes:[:method, :recipe_id])
	end

end
