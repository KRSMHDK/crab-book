class BooksController < ApplicationController
  def index; end

  def new
    @book = Book.new
    @author = Author.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
    @book = current_user.books.new(book_params)

    if @book.save!
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :genre, :publication_date, :page_count, :language, :rating, :description,
                                 :published_at, :image, :author_id)
  end
end
