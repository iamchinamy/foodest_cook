class Step < ApplicationRecord

	belongs_to :recipe
	
	validates :method, presence: true

end
