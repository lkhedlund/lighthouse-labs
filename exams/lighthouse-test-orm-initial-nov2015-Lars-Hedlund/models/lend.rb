class Lend < ActiveRecord::Base

  belongs_to :library
  belongs_to :book

  validate :invalid_checkout
  validate :invalid_checkin

  def invalid_checkout
    # easier to read than trailing if statement due to length
    if checkout > due
      errors[:due] = "due date must be after checkout"
    end
  end

  def invalid_checkin
    if checkout > checkin
      errors[:checkin] = "checkin date must be after checkout"
    end
  end

  def overdue?
    checkin > due #|| passed_due_date
  end

  def fees
    (checkin - due) * library.late_fee
  end

  def days
    due - checkout
  end

  def passed_due_date
    due < Date.today if checkin.nil?
  end

end
