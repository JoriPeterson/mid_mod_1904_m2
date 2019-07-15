require 'rails_helper'

RSpec.describe "Author Show Page" do
  describe "As a user" do
    describe "When I visit the books index" do
      before(:each) do
        @catch_22 = Book.create!(title: "Catch 22", number_of_pages: 400, publication_year: 1952)
        @mockingbird = Book.create!(title: "To Kill A Mockingbird", number_of_pages: 250, publication_year: 1960)
        @heller = Author.create!(name: "Joseph Heller")
        @lee = Author.create!(name: "Harper Lee")
        @author_book_1 = @heller.author_books.create!(author_id: @heller.id, book_id: @catch_22.id)
        @author_book_2 = @lee.author_books.create!(author_id: @lee.id, book_id: @mockingbird.id)
      end
      it "I see each author's name is a link" do
        visit books_path

        within "#book-#{@catch_22.id}" do
          expect(page).to have_content(@catch_22.author_name)
        end

        within "#book-#{@mockingbird.id}" do
          expect(page).to have_content(@mockingbird.author_name)
        end
      end

      it "When I click the link I am taken to the author's show page with their info" do

        visit books_path

        within "#book-#{@catch_22.id}" do
          click_on "#{@catch_22.author_name}"
        end

        expect(current_path).to eq(author_path(@heller.id))
        expect(page).to have_content(@heller.name)
        expect(page).to have_content(@catch_22.title)
        expect(page).to have_content(@heller.all_page_average)
      end
    end
  end
end
