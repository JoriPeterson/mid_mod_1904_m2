require 'rails_helper'

RSpec.describe Author do
  before(:each) do
    @catch_22 = Book.create!(title: "Catch 22", number_of_pages: 400, publication_year: 1961)
    @mockingbird = Book.create!(title: "To Kill A Mockingbird", number_of_pages: 250, publication_year: 1960)
    @something = Book.create!(title: "Something Happened", number_of_pages: 300, publication_year: 1974)
    @heller = Author.create!(name: "Joseph Heller")
    @lee = Author.create!(name: "Harper Lee")
    @author_book_1 = @heller.author_books.create!(author_id: @heller.id, book_id: @catch_22.id)
    @author_book_2 = @lee.author_books.create!(author_id: @lee.id, book_id: @mockingbird.id)
    @heller.books << @something
  end

  describe 'Relationships' do
    it {should have_many :author_books}
    it {should have_many(:books).through(:author_books)}
  end

  describe '#all_page_average' do
    it 'returns the average of all authors pages' do
      expect(@heller.all_page_average.to_f).to eq(350.0)
    end
  end

  describe '#books_by_author' do
    it 'returns all authors books' do
      expect(@heller.books_by_author).to eq([@catch_22, @something])
    end
  end
end
