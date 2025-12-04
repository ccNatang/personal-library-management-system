class BooksController < ApplicationController
  def index
    @books = Book.includes(:author, :genre).all
  end

  def new
    @book = Book.new
    @authors = Author.all
    @genres = Genre.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: "Book was successfully created."
    else
      @authors = Author.all
      @genres = Genre.all
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    @authors = Author.all
    @genres = Genre.all
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book, notice: "Book was successfully updated."
    else
      @authors = Author.all
      @genres = Genre.all
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, status: :see_other, notice: "'#{@book.title}' was successfully deleted."
  end

  private

  def book_params
    params.require(:book).permit(:title, :author_id, :genre_id)
  end
end
