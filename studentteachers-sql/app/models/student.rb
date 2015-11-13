class Student < ActiveRecord::Base
  # implement your Student model here
  belongs_to :teacher

  validates :email, uniqueness: true
  validates :birthday, numericality: { minimum: Date.today - 3.years}

  def name
    first_name + " " + last_name
  end

  def age
    now = Date.today
    now.year - birthday.year
  end

end
