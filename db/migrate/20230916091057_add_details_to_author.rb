class AddDetailsToAuthor < ActiveRecord::Migration[7.0]
  def change
    add_column :authors, :description, :string
    add_column :authors, :dob, :string
    add_column :authors, :language, :string
  end
end
