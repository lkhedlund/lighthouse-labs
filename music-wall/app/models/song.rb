class Song < ActiveRecord::Base

  has_many :upvotes
  has_many :reviews

  validates :title,
    presence: true,
    uniqueness: true
  validates :artist,
    presence: true
  validates :url,
    presence: true,
    format: { with: /https?:\/\/(?:[a-z0-9\-]+\.)+[a-z]{2,6}(?:\/[^\/#?]+)+\.(?:jpg|gif|png)/ }

end
