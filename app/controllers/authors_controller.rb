class AuthorsController < ApplicationController
  def index
    if user_signed_in?
      @authors = Author.all.page(params[:page])
    else
      @authors = []
    end
  end

  def new
    @author = Author.new
  end

  def show
    @author = Author.find(params[:id])
    @author_books = @author.books.limit(10)
  end

  def create
    @author = current_user.authors.new(author_params)

    if @author.save!
      redirect_to @author, notice: 'Author was successfully created.'
    else
      render :new
    end
  end

  private

  def author_params
    params.require(:author).permit(:name, :dob, :description, :image)
  end
end
