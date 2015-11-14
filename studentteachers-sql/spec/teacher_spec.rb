require_relative 'spec_helper'

describe Teacher do
  before(:all) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless ActiveRecord::Base.connection.table_exists?(:teachers)
  end

  context 'validations' do
      before(:each) do
        @teacher = Teacher.new
        @teacher.assign_attributes(
          name: "Willy Wonka",
          email: "wonka@college.ca",
          address: "Blackfoot Trail",
          phone: "200-0012"
        )
        @student = Student.new
        @student.assign_attributes(
          first_name: 'Jim',
          last_name: 'Darkmagic',
          birthday: Date.new(1987, 1, 10),
          gender: 'male',
          email: 'dark@magic.com',
          phone: '555-6666',
          teacher_id: 1
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

    it "should not accept a hired date after retirement date" do
      @teacher.hire_date = 2.days.ago
      @teacher.retirement_date = 3.days.ago
      expect(@teacher).to_not be_valid
    end

    it "should accept a retirement date after a hire date" do
      @teacher.hire_date = 3.days.ago
      @teacher.retirement_date = 2.days.ago
      expect(@teacher).to be_valid
    end

    it "should not let a teacher retire in the future" do
      @teacher.retirement_date = 3.days.from_now
      expect(@teacher).to_not be_valid
    end

    it "should set all students teachers to nil after retirement" do
      @teacher.assign_attributes(retirement_date: Date.today)
      @teacher.save
      @student.reload
      expect(@student.teacher_id).to eq(nil)
    end
  end
end
