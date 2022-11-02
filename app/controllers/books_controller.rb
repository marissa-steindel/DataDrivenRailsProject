class BooksController < ApplicationController
  def index
    @books = Book.includes(:author).order(:id).page(params[:page])
  end

  def show
    @book = Book.find(params[:id])
  end

  def search_results
    @books = Book.where( 'title LIKE ?', "%#{params[:query]}%" )
  end

  def about
  end
end
