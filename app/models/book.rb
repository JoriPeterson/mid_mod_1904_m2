class Book < ApplicationRecord
  has_many :author_books
  has_many :authors, through: :author_books

  def author_id
    author = author_books.where(book_id: self.id).pluck(:author_id).first
  end

  def author_name
     # Author.joins(:author_books).where(book_id: self.id).pluck(:name)
    authors.where(id: self.author_id).pluck(:name).first
  end
end
