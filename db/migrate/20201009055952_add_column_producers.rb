class AddColumnProducers < ActiveRecord::Migration[5.2]
  def change
  	add_column :producers, :introduction, :string
  end
end
