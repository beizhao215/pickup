class AddStatusToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :status, :boolean, default: false
  end
end
