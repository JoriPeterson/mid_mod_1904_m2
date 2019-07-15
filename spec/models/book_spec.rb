require 'rails_helper'

RSpec.describe Book do

  describe 'Relationships' do
    it {should have_many :author_books}
    it {should have_many(:authors).through(:author_books)}
  end
end
