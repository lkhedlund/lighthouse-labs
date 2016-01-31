require './spec_helper'

describe Lend do
  before :each do
    @library = FactoryGirl.build :library
    @lend = FactoryGirl.build :lend, library: @library
  end

  describe '#days' do
    it 'returns 2 when due date is calculated to be 2 days after the checkout date' do
      expect(@lend.days).to eq(2)
    end

    it 'returns 5 when due date is calculated to be 5 days after checkout date' do
      @lend.checkout = Date.today
      @lend.due = 5.days.from_now.to_date
      expect(@lend.days).to eq(5)
    end
  end

  describe '#extended (database field)' do
    it 'default behavior: is set to false if it is due after 2 days.' do
      expect(@lend.extended).to be_falsey
    end

    it 'is updated to true if it is due after more than 2 days' do
      @lend.due = 10.days.from_now.to_date
      @lend.save!
      expect(@lend.extended).to be_truthy
    end
  end
end
