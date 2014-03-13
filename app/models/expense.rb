class Expense < ActiveRecord::Base
  belongs_to :event, inverse_of: :expenses

  validates :category_details,  presence: true
  validates :estimated_amount,  presence: true
  validates :event_id,          presence: true
end
