class Teacher < ActiveRecord::Base

  has_many :students

  validates :email, uniqueness: true

  validate :hire_before_retire
  validate :retired_before_today

  after_save :has_retired#, if: :students

  private

  def hire_before_retire
    return if retirement_date.nil?
    if hire_date > retirement_date
      errors.add(:retirement_date, "retirement date cannot be before hire date")
    end
  end

  def retired_before_today
    return if retirement_date.nil?
    if retirement_date > Date.today
      errors.add(:retirement_date, "retirement date cannot be set to a future date")
    end
  end

  def has_retired
    puts "retired!"
  end

end
