class Producer::ProducersController < ApplicationController
	# 生産者の情報公開

	def index
		@producers = Producer.all
	end

	def show
		@producer = Producer.find(params[:id])
	end

end
