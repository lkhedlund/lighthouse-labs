class Student < ActiveRecord::Base
  # implement your Student model here
  belongs_to :teacher
  
end
