class Producer::ProductsController < ApplicationController

	before_action :authenticate_user!

	def index
		@products = Product.all
	end

	def show
		@product = Product.find(params:[:id])
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_params)
		#if文追加する
		@product.save
	end

	def show
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		@product.update(product_params)
		#redirect_to
	end

private
	def product_params
		params.require(:product).permit(:name, :description, :price, :product_image, :producer_id)
	end

end
