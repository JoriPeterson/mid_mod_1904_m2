require 'rails_helper'

RSpec.describe AuthorBook do

  describe 'Relationships' do
    it {should belong_to :author}
    it {should belong_to :book}
  end
end
