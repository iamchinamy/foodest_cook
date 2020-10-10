class Producer::HomesController < ApplicationController
	before_action :authenticate_producer!
	# マイページ関係

	def my_page
		@recipes = current_producer.recipes.all
	end

	def edit
		@producer = find_producer_by_id
	end

	def update
		@producer = find_producer_by_id
		if @producer.update(producer_params)
			redirect_to my_page_producer_homes_path
		else
			flash[:danger] = 'お客様の情報を更新できませんでした。'
			render :edit
		end
	end

private
	def producer_params
		params.require(:producer).permit(:email, :corporate_name, :representative, :post_code, :address, :phone_number, :introduction, :producer_image)
	end

	def find_producer_by_id
		Producer.find(params[:id])
	end


end
