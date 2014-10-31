class AddUsersInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :url, :string
    add_column :users, :username, :string
    add_column :users, :nickname, :string
    add_column :users, :password, :string
  end
end
