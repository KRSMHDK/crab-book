class BooksController < ApplicationController
  def index
    if user_signed_in?
      @books = Book.all.page(params[:page])
    else
      @books = {}
    end
  end

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
      SendEmailJob.perform_async(@book)
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  def get_data
    books = Book.all.map do |book|
      {
        author_name: book.author_name,
        title: book.title,
        genre: book.genre,
        publication_date: book.publication_date,
        page_count: book.page_count,
        language: book.language,
        rating: book.rating,
        description: book.description
      }
    end

    render json: books
  end

  private

  def book_params
    params.require(:book).permit(:title, :genre, :publication_date, :page_count, :language, :rating, :description,
                                 :published_at, :image, :author_id)
  end
end
