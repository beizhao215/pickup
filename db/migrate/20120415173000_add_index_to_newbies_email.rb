class AddIndexToNewbiesEmail < ActiveRecord::Migration
  def change
    add_index :newbies, :email, unique: true
  end
end
