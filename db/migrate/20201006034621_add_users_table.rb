class AddUsersTable < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t| 
      t.string :username 
      t.text :email 
      t.timestamps
    end 
  end
end
