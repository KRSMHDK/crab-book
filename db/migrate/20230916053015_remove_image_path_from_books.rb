class RemoveImagePathFromBooks < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :image_path
  end
end
