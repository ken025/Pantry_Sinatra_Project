class CreateItemsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name 
      t.integer :quantity 
      t.timestamps
    end 
  end
end
