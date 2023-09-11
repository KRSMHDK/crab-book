class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.belongs_to :author, foreign_key: true
      t.string :title
      t.string :genre
      t.date :publication_date
      t.integer :page_count
      t.string :language
      t.integer :rating
      t.text :description
      t.string :image_path
      t.datetime :published_at
      t.timestamps
    end
  end
end
