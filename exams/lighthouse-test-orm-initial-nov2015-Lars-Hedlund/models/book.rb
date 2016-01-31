class Book < ActiveRecord::Base

  belongs_to :library
  has_many :lends

  validates :title,
    presence: true,
    length: { maximum: 500 }
  validates :author,
    presence: true,
    length: { in: 5..100 }
  validates :pages,
    presence: Numeric,
    numericality: { greater_than_or_equal_to: 4 }

  validates_format_of :isbn, :with => /\d{9}-(\d|[X])/

  validate :available?

  def available?
    if self.lends.empty? || due_today?
      return true
    else
      checkout_and_overdue?
    end
  end

  private

  def checkout_and_overdue?
    lends.overdue? || lends.checkout
  end

  def due_today?
    lends.due == Date.today
  end
end
