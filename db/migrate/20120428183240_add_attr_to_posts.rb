class AddAttrToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :number_of_people, :integer
    add_column :posts, :arrival_date, :date
    add_column :posts, :arrival_time, :time
    add_column :posts, :flight_number, :string
    add_column :posts, :luggage_number, :string
    add_column :posts, :destination, :string
  end
end
