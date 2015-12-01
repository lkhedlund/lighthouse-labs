class Teacher < ActiveRecord::Base

  has_many :students

  validates :email,
    uniqueness: true,
    format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

  validate :hired_greater_than_retired, if: :hired_and_retired?
  validate :retired_set_in_future, if: :retirement_date

  after_save :has_retired, if: :retirement_date

  private

  def hired_greater_than_retired
    if hire_date > retirement_date
      errors.add(:retirement_date, "retirement date cannot be before hire date")
    end
  end

  def retired_set_in_future
    if retirement_date > Date.today
      errors.add(:retirement_date, "retirement date cannot be set to a future date")
    end
  end

  def hired_and_retired?
    hire_date && retirement_date
  end

  def has_retired
    students.update_all(teacher_id: nil)
  end

end
