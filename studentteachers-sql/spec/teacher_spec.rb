require_relative 'spec_helper'

describe Teacher do
  before(:all) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Base.connection.table_exists?(:teachers)
  end

  context '#name and #age' do
    before(:each) do
      @teacher = Teacher.new
      @teacher.assign_attributes(
        name: 'Gumpy Gilmore',
        email: 'gilmore@college.ca',
        address: 'Blackfoot Trail',
        phone: "200-0010"
      )
    end
  end

  context 'validations' do
    before(:each) do
      @teacher = Teacher.new
      @teacher.assign_attributes(
        name: 'Sally Shawn',
        email: 'shawn@college.ca',
        phone: '200-0011'
      )
    end

    it 'should accept valid info' do
      expect(@teacher).to be_valid
    end

    it "shouldn't allow two teachers with the same email" do
      Teacher.create!(
        email: @teacher.email,
        phone: @teacher.phone
      )
      expect(@teacher).to_not be_valid
    end
  end
end
