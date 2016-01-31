require './spec_helper'

describe Library do
  before :each do
    @library = FactoryGirl.create :library, name: 'Library 1'
    @book1 = FactoryGirl.create :book, library: @library
    @book2 = FactoryGirl.create :book, library: @library
    @lend1 = FactoryGirl.create :lend, library: @library, book: @book1
    @lend2 = FactoryGirl.build :overdue_lend, library: @library, book: @book2
    @library2 = FactoryGirl.create :library, name: 'Library 2'
    @book_for_library2 = FactoryGirl.create :book, library: @library2
    @lend_for_library2 = FactoryGirl.create :lend, library: @library2, book: @book_for_library2
  end

  describe '#revenue (database field)' do
    it "is increased by a lend's late fees when a book is returned late" do
      expect(@library.revenue).to eql(0)
      @library.late_fee = 20
      @lend2.save
      expect(@library.reload.revenue).to eq(140)
    end
  end
end

describe Book do
  context 'without a library' do
    before :each do
      @book = FactoryGirl.build :book, library: nil
    end

    describe 'creation' do
      it 'should work fine' do
        @book.save
        expect(@book).to be_valid
      end
    end

    describe 'destruction' do
      it 'should work fine' do
        @book.save
        @book.destroy
        expect(Book.find_by_id(@book.id)).to be_nil
      end
    end
  end
end
