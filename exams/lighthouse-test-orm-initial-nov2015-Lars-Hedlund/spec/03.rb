require './spec_helper'

describe Book do
  before :each do
    @book = FactoryGirl.build :book
  end

  describe '#title' do
    it 'is required' do
      @book.title = nil
      expect(@book).to_not be_valid
      expect(@book.errors[:title]).to include "can't be blank"
      @book.title = 'The greatest story'
      expect(@book).to be_valid
    end

    it 'is a max of 500 characters' do
      @book.title = 'a' * 501
      expect(@book).to_not be_valid
      expect(@book.errors[:title]).to include 'is too long (maximum is 500 characters)'
    end
  end

  describe '#author' do
    it 'is required' do
      @book.author = nil
      expect(@book).to_not be_valid
      expect(@book.errors[:author]).to include "can't be blank"
    end

    it 'should be between 5 and 100 characters in length' do
      @book.author = 'A B'
      expect(@book).to_not be_valid
      expect(@book.errors[:author]).to include 'is too short (minimum is 5 characters)'
    end

    it 'should be between 5 and 100 characters in length' do
      @book.author = 'A' * 101
      expect(@book).to_not be_valid
      expect(@book.errors[:author]).to include 'is too long (maximum is 100 characters)'
    end
  end

  describe '#pages' do
    it 'is required (as a number)' do
      @book.pages = nil
      expect(@book).to_not be_valid
      expect(@book.errors[:pages]).to include 'is not a number'
    end

    it "must be at least 4 (otherwise it's a pamphlet, not a book)" do
      @book.pages = 3
      expect(@book).to_not be_valid
      expect(@book.errors[:pages]).to include 'must be greater than or equal to 4'
    end
  end
end
