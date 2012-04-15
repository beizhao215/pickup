class AddPasswordDigestToNewbies < ActiveRecord::Migration
  def change
    add_column :newbies, :password_digest, :string
  end
end
