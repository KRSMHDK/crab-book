class Book < ApplicationRecord
  belongs_to :author
  belongs_to :user
  has_one_attached :image

  def author_name
    author.name if author
  end
end
