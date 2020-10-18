class Producer::RecipesController < ApplicationController

	before_action :authenticate_producer!, only: [:create, :update, :destroy]

	def index
		@recipes = Recipe.all
	end

	def search
		@recipes = Recipe.search(params[:keyword])
	end

	def show
		@recipe = Recipe.find(params[:id])
		@producer = @recipe.producer
		@ingredients = @recipe.ingredients.all
		@steps = @recipe.steps.all
		@like = Like.new
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
   			tags = Vision.get_image_data(@recipe.recipe_image)
    		tags.each do |tag|
      			@recipe.tags.create(name: tag)
    		end
			flash[:success] = "レシピを追加しました"
			redirect_to producer_recipe_path(@recipe.id)
		else
			flash.now[:danger] = "レシピの投稿に失敗しました"
			render 'new'
		end
	end

	def update
		@recipe = Recipe.find(params[:id])
		if @recipe.update(recipe_params)
			flash[:success] = "レシピを修正しました。"
			redirect_to producer_recipe_path(@recipe.id)
		else
			flash.now[:danger] = "レシピの修正に失敗しました"
			render 'edit'
		end
	end

	def destroy
		@recipe = Recipe.find(params[:id])
		if @recipe.destroy
			flash[:notice] = 'レシピを削除しました'
			redirect_to producer_recipes_path
		end
	end

private
	def recipe_params
		params.require(:recipe).permit(:title, :description, :total_time, :recipe_image, :producer_id, ingredients_attributes:[:item, :amount, :recipe_id], steps_attributes:[:method, :recipe_id])
	end

end
