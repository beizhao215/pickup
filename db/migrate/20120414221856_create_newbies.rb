class CreateNewbies < ActiveRecord::Migration
  def change
    create_table :newbies do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
