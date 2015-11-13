require_relative 'spec_helper'

describe Teacher do
  before(:all) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Base.connection.table_exists?(:teachers)
  end

  context '#name and #age' do
    before(:each) do
      @teacher = Teacher.new
      @teacher.assign_attributes(
        first_name: 'Happy',
        last_name: 'Gilmore',
        gender: 'male',
        birthday: Date.new(1970, 9, 1)
      )
    end

    it 'should have name and age methods' do
      [:name, :age].each { |method| expect(@teacher).to respond_to(method) }
    end

    it 'should concatenate first and last name' do
      expect(@teacher.name).to eq('Happy Gilmore')
    end

    it 'should be the right age' do
      now = Date.today
      age = now.year - @teacher.birthday.year - ((now.month > @teacher.birthday.month || (now.month == @teacher.birthday.month && now.day >= @teacher.birthday.day)) ? 0 : 1)
      expect(@teacher.age).to eq(age)
    end
  end

  context 'validations' do
    before(:each) do
      @teacher = Teacher.new
      @teacher.assign_attributes(
        first_name: 'Kreay',
        last_name: 'Shawn',
        birthday: Date.new(1989, 9, 24),
        gender: 'female',
        email: 'kreayshawn@oaklandhiphop.net',
        phone: '(510) 555-1212 x4567'
      )
    end

    it 'should accept valid info' do
      expect(@teacher).to be_valid
    end

    it "shouldn't accept invalid emails" do
      ['XYZ!bitnet', '@.', 'a@b.c'].each do |address|
        @teacher.assign_attributes(email: address)
        expect(@teacher).to_not be_valid
      end
    end

    it 'should accept valid emails' do
      ['joe@example.com', 'info@bbc.co.uk', 'bugs@facebook.com'].each do |address|
        @teacher.assign_attributes(email: address)
        expect(@teacher).to be_valid
      end
    end

    it "shouldn't accept toddlers" do
      @teacher.assign_attributes(birthday: Date.today - 3.years)
      expect(@teacher).to_not be_valid
    end

    it "shouldn't allow two teachers with the same email" do
      Teacher.create!(
        birthday: @teacher.birthday,
        email: @teacher.email,
        phone: @teacher.phone
      )
      expect(@teacher).to_not be_valid
    end
  end
end
