require './spec_helper'

describe Book do
  before :each do
    @book = FactoryGirl.create :book
  end

  describe '#available?' do
    context 'without any lends' do
      it 'returns true (considered available if has no lends)' do
        expect(@book.available?).to be_truthy
      end
    end

    context 'currently checked out' do
      before :each do
        @lend = FactoryGirl.create :current_lend, book: @book, library: @book.library
      end

      it 'returns false (considered unavailable if checked out)' do
        expect(@book.available?).to be_falsey
      end
    end

    context 'currently checked out and overdue' do
      before :each do
        @overdue = FactoryGirl.create :unreturned_lend, book: @book, library: @book.library
      end

      it 'returns false (considered unavailable if checked out and overdue)' do
        expect(@book.available?).to be_falsey
      end
    end

    context 'due today' do
      before :each do
        @due_today = FactoryGirl.create :lend, due: Date.today, checkin: nil, checkout: 2.days.ago.to_date, book: @book, library: @book.library
      end

      it 'returns true (considered available if due today)' do
        expect(@book.available?).to be_truthy
      end
    end
  end
end
