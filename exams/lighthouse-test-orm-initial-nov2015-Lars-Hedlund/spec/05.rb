require './spec_helper'

describe Lend do
  before :each do
    @lend = Lend.new
    @library = Library.new
    @book = Book.new
  end

  describe 'associations' do
    it 'should be able to get its library' do
      expect { @lend.library }.to_not raise_error
    end

    it 'should be able to set its library' do
      expect { @lend.library = @library }.to_not raise_error
    end

    it 'should be able to get its book' do
      expect { @lend.book }.to_not raise_error
    end

    it 'should be able to set its book' do
      expect { @lend.book = @book }.to_not raise_error
    end
  end

  describe 'validations' do
    it 'should be invalid if the due date is before the checkout date' do
      @lend.due = 1.day.ago.to_date
      @lend.checkout = Date.today
      expect(@lend).to_not be_valid
      expect(@lend.errors[:due]).to include 'due date must be after checkout'
    end

    it 'should be invalid if the checkin date is before the checkout date' do
      @lend.checkin = 1.day.ago.to_date
      @lend.checkout = Date.today
      expect(@lend).to_not be_valid
      expect(@lend.errors[:checkin]).to include 'checkin date must be after checkout'
    end
  end
end
