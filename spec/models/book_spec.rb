require 'rails_helper'

RSpec.describe Book do
  before(:each) do
    @catch_22 = Book.create!(title: "Catch 22", number_of_pages: 400, publication_year: 1952)
    @mockingbird = Book.create!(title: "To Kill A Mockingbird", number_of_pages: 250, publication_year: 1960)
    @heller = Author.create!(name: "Joseph Heller")
    @lee = Author.create!(name: "Harper Lee")
    @author_book_1 = @heller.author_books.create!(author_id: @heller.id, book_id: @catch_22.id)
    @author_book_2 = @lee.author_books.create!(author_id: @lee.id, book_id: @mockingbird.id)
  end

  describe 'Relationships' do
    it {should have_many :author_books}
    it {should have_many(:authors).through(:author_books)}
  end

  describe '#author_id' do
    it 'returns the name of the books author_id' do
      expect(@catch_22.author_id).to eq(@heller.id)
    end
  end

  describe '#author_name' do
    it 'returns the name of the books author' do
      expect(@catch_22.author_name).to eq(@heller.name)
    end
  end

end
