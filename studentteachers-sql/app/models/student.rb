class Student < ActiveRecord::Base
  # implement your Student model here
  belongs_to :teacher

  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validate :cannot_be_too_young

  def cannot_be_too_young
    if birthday >= Date.today - 3.years
      errors.add(:birthday, "can't be too young")
    end
  end

  def name
    first_name + " " + last_name
  end

  def age
    now = Date.today
    now.year - birthday.year
  end

end
