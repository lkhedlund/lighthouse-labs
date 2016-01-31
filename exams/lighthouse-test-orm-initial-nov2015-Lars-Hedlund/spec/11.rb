require './spec_helper'

describe Book do
  before :each do
    @book = FactoryGirl.build :book
  end

  describe 'validations' do
    describe 'for ISBN' do
      it "disallows '11456789a-0' since it doesn't match the format #########-? where # is always a number and ? is either a number or X" do
        @book.isbn = '11456789a-0'
        expect(@book).to_not be_valid
        expect(@book.errors[:isbn]).to include 'is not a valid ISBN'
      end

      it "disallows '114X6789a-X' since it doesn't match the format #########-? where # is always a number and ? is either a number or X" do
        @book.isbn = '114X6789a-X'
        expect(@book).to_not be_valid
        expect(@book.errors[:isbn]).to include 'is not a valid ISBN'
      end

      it "disallows '11436789344-X' since it doesn't match the format #########-? where # is always a number and ? is either a number or X" do
        @book.isbn = '11436789344-X'
        expect(@book).to_not be_valid
        expect(@book.errors[:isbn]).to include 'is not a valid ISBN'
      end

      it "allows '114567893-X' since it matches the format #########-? where # is always a number and ? is either a number or X" do
        @book.isbn = '114567893-X'
        expect(@book).to be_valid
      end

      it "allows '114567893-2' since it matches the format #########-? where # is always a number and ? is either a number or X" do
        @book.isbn = '114567893-2'
        expect(@book).to be_valid
      end

      it "allows '235632434-8' since it matches the format #########-? where # is always a number and ? is either a number or X" do
        @book.isbn = '235632434-8'
        expect(@book).to be_valid
      end
    end
  end
end
