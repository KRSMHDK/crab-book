class HomeController < ApplicationController
  def index
    @books = Book.all
    if user_signed_in?
      @books = current_user.books
    end
  end
end
