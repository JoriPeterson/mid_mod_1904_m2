class Book < ApplicationRecord
  has_many :authors, through: :author_books
  has_many :author_books
end
