class FinanceApprover < ActiveRecord::Base
  belongs_to :user
  belongs_to :organization
  
  validates_presence_of :user_id, :organization_id

  def self.fa_users
    ids = FinanceApprover.pluck(:user_id).uniq.sort
    binding.pry
    ids.map {|id| User.find(id)}
  end
end

