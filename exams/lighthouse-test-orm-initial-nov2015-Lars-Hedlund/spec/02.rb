require './spec_helper'

describe Library do
  before :each do
    @library = FactoryGirl.build :library
  end

  describe '#name' do
    it 'is required' do
      @library.name = nil
      expect(@library).to_not be_valid
      expect(@library.errors[:name]).to include "can't be blank"
    end

    it 'must be longer than 3 letters' do
      @library.name = 'abc'
      expect(@library).to_not be_valid
      expect(@library.errors[:name]).to include 'is too short (minimum is 4 characters)'
    end

    it 'must be unique' do
      another_library = FactoryGirl.create :library
      @library.name = another_library.name
      expect(@library).to_not be_valid
      expect(@library.errors[:name]).to include 'has already been taken'
    end
  end

  describe '#late_fee' do
    it "is required (can't be nil; must be a number)" do
      @library.late_fee = nil
      expect(@library).to_not be_valid
      expect(@library.errors[:late_fee]).to include 'is not a number'
    end

    it 'must be a number (integer) only' do
      @library.late_fee = 'abc'
      expect(@library).to_not be_valid
      expect(@library.errors[:late_fee]).to include 'is not a number'
    end
  end

  describe '#capacity' do
    it 'is required to be number' do
      @library.capacity = nil
      expect(@library).to_not be_valid
      expect(@library.errors[:capacity]).to include 'is not a number'
    end

    it 'must be a number (integer) only' do
      @library.capacity = 'abc'
      expect(@library).to_not be_valid
      expect(@library.errors[:capacity]).to include 'is not a number'
    end

    it 'must be at least 1000' do
      @library.capacity = 999
      expect(@library).to_not be_valid
      expect(@library.errors[:capacity]).to include 'must be greater than or equal to 1000'
    end
  end
end
