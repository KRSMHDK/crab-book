class NotifierMailer < ApplicationMailer
  def book_created_mailer
    @book = params[:book]

    mail(to: @book.user.email, subject: "You succesfully added a new book!")
  end

  def author_created_mailer
    @author = params[:author]

    mail(to: @author.user.email, subject: "You succesfully added a new book!")
  end
end
