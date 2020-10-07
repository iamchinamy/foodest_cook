class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|

    	t.integer :producer_id
    	t.string :recipe_image_id
    	t.string :title
    	t.text :description
    	t.integer :total_time

      t.timestamps
    end
  end
end
