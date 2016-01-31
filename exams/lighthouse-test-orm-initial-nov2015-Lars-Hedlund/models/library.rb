class Library < ActiveRecord::Base

  has_many :books, dependent: :destroy
  has_many :lends

  validates :name,
    presence: true,
    length: { minimum: 4 },
    uniqueness: true
  validates :late_fee,
    presence: true,
    numericality: { only_integer: true }
  validates :capacity,
    presence: Numeric,
    numericality: { only_integer: true, greater_than_or_equal_to: 1000 }

  after_save :increase_revenue

  def increase_revenue
    revenue = lends.reduce(0) do |sum, lend|
      sum += lend.fees
    end
  end
end
