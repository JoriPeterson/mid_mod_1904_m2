class BooksController < ApplicationController

  def index
    @books = Book.all
    @author = 
  end
end
