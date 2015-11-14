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

    context 'callbacks' do
      before(:each) do
        @student = Student.new
        @student.assign_attributes(
          first_name: 'Jim',
          last_name: 'Darkmagic',
          birthday: Date.new(1987, 1, 10),
          gender: 'male',
          email: 'dark@magic.com',
          phone: '555-6666'
        )
        @teacher = Teacher.new
        @teacher.assign_attributes(
          name: "Willy Wonka",
          email: "wonka@college.ca",
          address: "Blackfoot Trail",
          phone: "200-0012"
        )
      end

      it "should remove all students if the teacher is retired" do
        @student.teacher = @teacher
        @student.save
        @teacher.assign_attributes(retirement_date: Date.today)
        @teacher.save
        puts @student.inspect, @teacher.inspect
        expect(@student.teacher_id).to eq(nil)
      end
    end
  end
end
