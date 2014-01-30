class Role < ActiveRecord::Base
  has_and_belongs_to_many :users

  belongs_to :finance_approver, class_name: "User"
  
  validates :name, presence: true, uniqueness: true

  def self.finance_approver
    self.find_by_name("finance approver").users
  end
end

