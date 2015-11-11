class Employee < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :hourly_rate, length: {in: 40..200}, numericality: {only_integer: true}
  validates :store_id, presence: true

  belongs_to :store

end
