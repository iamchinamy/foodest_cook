class RenameCustomerIdCoulumnToLikes < ActiveRecord::Migration[5.2]
  def change
  	rename_column :likes, :customer_id, :producer_id
  end
end
