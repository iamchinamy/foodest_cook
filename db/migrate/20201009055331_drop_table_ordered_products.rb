class DropTableOrderedProducts < ActiveRecord::Migration[5.2]
  def change
  	drop_table :ordered_products
  end
end
