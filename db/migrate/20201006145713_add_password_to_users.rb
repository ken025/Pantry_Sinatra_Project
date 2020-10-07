class AddPasswordToUsers < ActiveRecord::Migration[5.2]
  def change
    # "_digest" decrypts the password
    add_column :users, :password_digest, :string
  end
end
