class BooksController < ApplicationController
  def new
    @book = Book.new
    @authors = Author.all
  end
  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to "/book/showAll", notice: "Book was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end
  def showAll
    @books = Book.all
  end
  def edit
    @book = Book.find(params[:id])
    @authors = Author.all
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to "/book/showAll", notice: "Book updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def delete
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to "/book/showAll"
    end
  end
  def books
    book = Book.find(params[:id])
    render json: book.to_json(include: :authors)
  end
  private
  
  def book_params
    params.require(:book).permit(:book_title, author_ids: [])
  end
end
