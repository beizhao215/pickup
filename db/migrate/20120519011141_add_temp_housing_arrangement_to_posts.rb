class AddTempHousingArrangementToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :temp_housing_arrangement, :string
  end
end
