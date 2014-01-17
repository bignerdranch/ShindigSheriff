class FinanceApprover < ActiveRecord::Base
  belongs_to :user
  belongs_to :organization
  
  validates_presence_of :user_id, :organization_id
end

