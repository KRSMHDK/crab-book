class SendEmailJob
  include Sidekiq::Job

  def perform(book)
    NotifierMailer.with(book: book).book_created_mailer.deliver_now
  end
end
