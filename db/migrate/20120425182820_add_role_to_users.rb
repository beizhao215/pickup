class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :newbie, :boolean
  end
end
