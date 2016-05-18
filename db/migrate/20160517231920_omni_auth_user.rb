class OmniAuthUser < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string, null: false       # for the unique user identifier from the provider
    add_column :users, :provider, :string, null: false
    add_column :users, :name, :string
  end
end
