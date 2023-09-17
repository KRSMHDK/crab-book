class HomeController < ApplicationController
  def index
    @books = Book.order(created_at: :desc).limit(8)
  end
end
