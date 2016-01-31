require './spec_helper'

describe Lend do
  before :each do
    @library = FactoryGirl.build :library
    @book = FactoryGirl.build :book
    @lend = FactoryGirl.build :lend, book: @book, library: @library
  end

  describe '#overdue?' do
    it 'returns true if the due date has passed' do
      @lend.checkout = 5.days.ago.to_date
      @lend.due = 3.days.ago.to_date
      expect(@lend.overdue?).to be_truthy
    end

    it 'returns true if checkin is after the due date' do
      @lend.checkout = 5.days.ago.to_date
      @lend.due = 3.days.ago.to_date
      @lend.checkin = 1.days.ago.to_date
      expect(@lend.overdue?).to be_truthy
    end

    it 'returns false if checked in on time even if in the past' do
      @lend.checkout = 5.days.ago.to_date
      @lend.due = 1.days.ago.to_date
      @lend.checkin = 3.days.ago.to_date
      expect(@lend.overdue?).to be_falsey
    end
  end

  describe '#fees' do
    it 'are calculated based on number of days late and library rate for overdue books' do
      @library.late_fee = 10
      @lend.checkout = 5.days.ago.to_date
      @lend.due = 3.days.ago.to_date
      @lend.checkin = Date.today
      expect(@lend.fees).to eq(30)
    end
  end
end
