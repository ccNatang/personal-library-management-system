require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should create book" do
    assert_difference("Book.count") do
      post books_url, params: { book: { title: "New Book", author_id: authors(:one).id, genre_id: genres(:one).id } }
    end

    assert_redirected_to book_url(Book.last)
  end
end
