class BooksController < ApplicationController
  # GET /books
  def index
    @books = Book.includes(:author).order(:title)
  end

  # GET /books/:id
  def show
    @book = Book.find(params[:id])
  end

  # GET /search/?query=user+input
  def search
    @books = Book.where( "title LIKE ?", "% #{params[:query]} %" )
  end
end
