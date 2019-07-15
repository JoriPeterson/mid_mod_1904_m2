require 'rails_helper'

RSpec.describe "Item Index" do
  describe "As a user" do
    describe "When I visit the books index" do
      before(:each) do
        @catch_22 = Book.create!(title: "Catch 22", number_of_pages: 400, publication_year: 1952)
        @mockingbird = Book.create!(title: "To Kill A Mockingbird", number_of_pages: 250, publication_year: 1960)
      end
      it "I see each book and its details" do

        visit books_path

        within "#book-#{@catch_22.id}" do
          expect(page).to have_content(@catch_22.title)
          expect(page).to have_content(@catch_22.number_of_pages)
          expect(page).to have_content(@catch_22.publication_year)
        end

        within "#book-#{@mockingbird.id}" do
          expect(page).to have_content(@mockingbird.title)
          expect(page).to have_content(@mockingbird.number_of_pages)
          expect(page).to have_content(@mockingbird.publication_year)
        end
      end
    end
  end
end
