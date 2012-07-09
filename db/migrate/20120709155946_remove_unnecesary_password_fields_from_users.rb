class RemoveUnnecesaryPasswordFieldsFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :password_salt
    remove_column :users, :password_hash
  end

  def down
    add_column :users, :password_hash, :string
    add_column :users, :password_salt, :string
  end
end
