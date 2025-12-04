require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "should save valid book" do
    book = Book.new(title: "The Hobbit", author: authors(:one), genre: genres(:one))
    assert book.save
  end

  test "should not save book without title" do
    book = Book.new(author: authors(:one), genre: genres(:one))
    assert_not book.save, "Saved the book without a title"
  end

  test "should not save duplicate book title per author" do
    # Assuming 'one' exists in fixtures
    existing_book = books(:one)
    duplicate_book = Book.new(title: existing_book.title, author: existing_book.author, genre: existing_book.genre)
    assert_not duplicate_book.save, "Saved duplicate book title for same author"
  end
end
