class Book < ApplicationRecord
  has_many :author_books
  has_many :authors, through: :author_books

  def books_authors
    self.authors
  end
end
