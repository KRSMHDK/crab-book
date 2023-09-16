class Author < ApplicationRecord
  has_many :books, dependent: :destroy
  belongs_to :user
  has_one_attached :image
end
