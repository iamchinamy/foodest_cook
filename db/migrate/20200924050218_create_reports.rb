class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.text :report
      t.integer :customer_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
