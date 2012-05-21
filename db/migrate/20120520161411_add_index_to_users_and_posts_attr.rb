class AddIndexToUsersAndPostsAttr < ActiveRecord::Migration
  def change
    add_index :users, [:gender, :newbie, :provide_housing, :major]
    add_index :posts, [:arrival_date, :arrival_time, :flight_number]
    add_index :posts, [:status, :need_housing]               
    add_index :posts, [:need_pickup, :entry_port]
    add_index :posts, [:temp_housing_arrangement]
  end
end
