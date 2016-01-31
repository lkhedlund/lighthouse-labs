class Contact < ActiveRecord::Base

  has_many :phones

  def to_s
    "#{id}: #{firstname} #{lastname} #{email}"
  end
end
