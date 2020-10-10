class Recipe < ApplicationRecord

	attachment :recipe_image

	belongs_to :producer

	has_many :ingredients, dependent: :destroy
	accepts_nested_attributes_for :ingredients, allow_destroy: true

	has_many :steps, dependent: :destroy
	accepts_nested_attributes_for :steps, allow_destroy: true

	has_many :likes, dependent: :destroy
	has_many :liked_producers, through: :likes, source: :producer

	validates :title, presence: true
	validates :description, length: {maximum: 56, minimum: 2}
	validates :total_time, presence: true
	

	# いいねしてるかどうか
	def liked_by?(producer)
		likes.where(producer_id: producer.id).exists?
	end

	# Topページのランキング
	def self.create_all_ranks
		Recipe.find(Like.group(:recipe_id).order('count(recipe_id) desc').limit(3).pluck(:recipe_id))
	end

	# レシピ検索
	def self.search(search)
		if search
			Recipe.where(['title LIKE ?', "%#{search}%"])
		else
			Recipe.all
		end
	end

end
