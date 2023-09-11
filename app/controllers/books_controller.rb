class BooksController < ApplicationController
  def index; end

  def new
    @book = Book.new
  end

  def show; end

  def create
    @book = Book.new(book_params)
    author = Author.last
    @book.author = author
    if @book.save!
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :genre, :publication_date, :page_count, :language, :rating, :description,
                                 :published_at)
  end
end
