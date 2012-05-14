class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.integer :pickedpost_id
      t.integer :volunteer_id

      t.timestamps
    end
    
    add_index :trips, :pickedpost_id
    add_index :trips, :volunteer_id
    add_index :trips, [:volunteer_id, :pickedpost_id], unique: true
  end
end
