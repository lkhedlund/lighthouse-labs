class User < ActiveRecord::Base

  has_many :upvotes
  has_many :reviews

  validates :email,
    presence: true,
    format: { with: /.+@.+\..+/i }
  validates :password,
    presence: true

end
