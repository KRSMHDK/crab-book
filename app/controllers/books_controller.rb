class BooksController < ApplicationController
  def index
    if user_signed_in?
      @books = Book.all.order(created_at: :desc).page(params[:page])
    else
      @books = {}
    end
  end

  def table
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

  def my_books
    if user_signed_in?
      @books = Book.where(user: current_user).order(created_at: :desc).page(params[:page])
    else
      @books = {}
    end
  end

  def show
    if user_signed_in?
      @book = Book.find(params[:id])
    else
      latest_book_ids = Book.order(created_at: :desc).limit(8).pluck(:id)

      unless latest_book_ids.include?(params[:id].to_i)
        redirect_to Book.find(latest_book_ids.first), notice: "You can only view the 8 latest books. Please sign in to view more."
        return
      end

      @book = Book.find(params[:id])
    end
  end

  def create
    @book = current_user.books.new(book_params)

    if @book.save!
      SendEmailJob.perform_async(@book)
      redirect_to my_books_path, notice: 'Book was successfully created.'
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
