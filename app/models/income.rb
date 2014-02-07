class Income < ActiveRecord::Base
  belongs_to :event
  
  validates :category_details, presence: true
  validates :category_id, presence: true
  validates :estimated_amount, presence: true
  validates :event_id, presence: true
end
