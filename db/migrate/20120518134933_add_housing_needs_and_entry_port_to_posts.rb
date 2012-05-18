class AddHousingNeedsAndEntryPortToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :need_housing, :boolean
    add_column :posts, :entry_port, :string
    add_column :posts, :need_pickup, :boolean
  end
end
