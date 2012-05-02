class AddAttrToUsers < ActiveRecord::Migration
  def change
    add_column :users, :qq, :string
    add_column :users, :phone, :string
    add_column :users, :renren, :string
  end
end
