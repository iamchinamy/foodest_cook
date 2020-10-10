class Like < ApplicationRecord
	belongs_to :producer
	belongs_to :recipe

	validates_uniqueness_of :recipe_id, scope: :producer_id

end
