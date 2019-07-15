class Author < ApplicationRecord
  has_many :author_books
  has_many :books, through: :author_books

  def all_page_average
    self.books.average(:number_of_pages)
  end

  def books_by_author
    self.books
  end
end
