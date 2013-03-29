class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :integer
    add_column :users, :name, :string
    add_column :users, :username, :string
    add_column :users, :oauth_token, :string
    add_column :users, :oatuh_token_secret, :string
  end
end
