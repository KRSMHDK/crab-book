require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @admin = User.first
  end

  test 'User can create book' do
    sign_in @admin
    assert_changes('Book.all.length') do
      post books_path, params: {
        book: {
          author_id: Author.first.id,
          title: 'what',
          genre: 'genrehere',
          publication_date: 'before dinosaur',
          page_count: '5',
          language: 'english',
          rating: '5',
          description: 'whatever here'
        }
      }
    end
  end

  test 'User cannot create book without title' do
    sign_in @admin
    assert_raises(ActiveRecord::RecordInvalid, "Validation failed: Title can't be blank") do
      post books_path, params: {
        book: {
          author_id: Author.first.id,
          genre: 'genrehere',
          publication_date: 'before dinosaur',
          page_count: '5',
          language: 'english',
          rating: '5',
          description: 'whatever here'
        }
      }
    end
  end

  test "Not loggedin User can't go to the not 8 latest created books" do
    get book_path(1)
    assert_response :redirect
  end
end
