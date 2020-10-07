class AddColumnToItemnsTable < ActiveRecord::Migration[5.2]
  def change
                #route  #name    #syntax
    add_column :items, :user_id, :integer
  end
end
