class AddUserToAuthors < ActiveRecord::Migration[7.0]
  def change
    add_reference :authors, :user
  end
end
