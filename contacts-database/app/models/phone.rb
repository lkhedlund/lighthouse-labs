class Phone < ActiveRecord::Base

  validates :contact_id, presence: true

  belongs_to :contact


  def to_s
    "\t#{phone_type}: #{digits}"
  end
end
