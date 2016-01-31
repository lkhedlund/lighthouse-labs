class Review < ActiveRecord::Base

  belongs_to :user
  belongs_to :song

  validates :content,
    presence: true
  validates :user_id,
    presence: true
  validates :song_id,
    presence: true
  validates :rating,
    presence: true


end
