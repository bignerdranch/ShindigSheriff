class Income < ActiveRecord::Base
  belongs_to :event
  validates_presence_of :event_id, :estimated_amount, :category_details
  validates :category_id, presence: true
end
