class FinanceApproverRole < ActiveRecord::Base
  belongs_to :user
  belongs_to :finance_approver, class_name: "User"
  
  validates_presence_of :user_id

  def self.fa_users
    ids = FinanceApproverRole.pluck(:user_id).uniq.sort
    ids.map {|id| User.find(id)}
  end
end

