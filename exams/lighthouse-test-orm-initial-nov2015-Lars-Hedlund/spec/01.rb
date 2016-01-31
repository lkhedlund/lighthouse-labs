require './spec_helper'

describe Book do
  before :each do
    @book = Book.new
    @library = Library.new
  end

  describe 'associations' do
    it 'should be able to get its library' do
      expect { @book.library }.to_not raise_error
    end

    it 'should be able to set its library' do
      expect { @book.library = @library }.to_not raise_error
    end
  end
end

describe Library do
  before :each do
    @library = Library.new
  end

  describe 'associations' do
    it 'should be able to get its books' do
      expect { @library.books }.to_not raise_error
    end

    it 'should be able to set its books' do
      expect { @library.books.new }.to_not raise_error
    end
  end
end
