class FinanceApproverRole < ActiveRecord::Base
  belongs_to :user
  belongs_to :finance_approver, class_name: "User"
  
  validates_presence_of :user_id

  def self.users
    FinanceApproverRole.all.map(&:user)
  end
end

