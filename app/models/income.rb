class Income < ActiveRecord::Base
  belongs_to :event
  belongs_to :category

  validates_presence_of :event_id, :estimated_amount, :category_details, :category_id
end
