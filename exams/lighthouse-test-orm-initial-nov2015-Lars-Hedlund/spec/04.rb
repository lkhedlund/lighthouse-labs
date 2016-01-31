require './spec_helper'

describe Library do
  before :each do
    @library = FactoryGirl.create :library
    @library2 = FactoryGirl.create :library, name: 'Library'
    @book1 = FactoryGirl.create :book, library: @library
    @book2 = FactoryGirl.create :book, library: @library
    @book_for_another_library = FactoryGirl.create :book, library: @library2
  end

  describe '#destroy' do
    it 'also destroys the books when the library is destroyed' do
      @library.destroy
      expect(Book.find_by_id(@book1.id)).to be_nil
      expect(Book.find_by_id(@book2.id)).to be_nil
      expect(Book.find_by_id(@book_for_another_library.id)).to be_a(Book)
    end
  end
end
