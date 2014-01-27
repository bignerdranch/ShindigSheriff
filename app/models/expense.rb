class Expense < ActiveRecord::Base
  belongs_to :event
  validates_presence_of :event_id, :estimated_amount, :category_details
end
