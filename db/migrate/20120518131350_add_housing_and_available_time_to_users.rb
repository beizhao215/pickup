class AddHousingAndAvailableTimeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provide_housing, :boolean
    add_column :users, :housing_number, :integer
    add_column :users, :available_pickup_time, :string
  end
end
