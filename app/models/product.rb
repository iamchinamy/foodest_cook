class Product < ApplicationRecord

	has_many :ordered_products
	has_many :cart_items
	attachment :product_image_id

	enum status: {
		販売中: 0,
		売り切れ: 1
	}

end
