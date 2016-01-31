class Employee < ActiveRecord::Base
  belongs_to :store

  validates :first_name,
    presence: true
  validates :last_name,
    presence: true

    after_create :increase_employee_count, if: :store
    before_destroy :decrease_employee_count, if: :store

  def increase_employee_count
    store.female_employees += 1 if gender == "F"
    store.male_employees += 1 if gender == "M"
    store.save
  end

  def decrease_employee_count
    store.female_employees -= 1 if gender == "F"
    store.male_employees -= 1 if gender == "M"
    store.save
  end

  def annual_salary
    hourly_rate * 1950
  end

  def self.average_hourly_rate_for(gender_val)
    gender_val = ['M', 'F'] unless which_gender
    where(gender: gender_val).average(:hourly_rate).round(2)
    # unless gender_val.nil?
    #   where(gender: gender_val).average(:hourly_rate).round(2)
    # else
    #   average(:hourly_rate).round(2)
    # end
  end

  # BAD CODE
  # after_create :increase_female_employees, if: :store
  # after_create :increase_male_employees, if: :store
  # before_destroy :decrease_male_employees, if: :store
  # before_destroy :decrease_female_employees, if: :store

  # def increase_male_employees
  #   store.male_employees += 1 if gender == "M"
  #   store.save
  # end
  #
  # def increase_female_employees
  #   store.female_employees += 1 if gender == "F"
  #   store.save
  # end

  # def decrease_male_employees
  #   store.male_employees -= 1 if gender == "M"
  #   store.save
  # end
  #
  # def decrease_female_employees
  #   store.female_employees -= 1 if gender == "F"
  #   store.save
  # end
end
