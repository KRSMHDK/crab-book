class HomeController < ApplicationController
  def index
    @books = Book.limit(8)
    if user_signed_in?
      @books = current_user.books
    end
  end
end
