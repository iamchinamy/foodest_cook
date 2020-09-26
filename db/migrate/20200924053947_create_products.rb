class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :product_image_id
      t.integer :producer_id

      t.timestamps
    end
  end
end
