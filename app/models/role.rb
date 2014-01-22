class Role < ActiveRecord::Base

  has_and_belongs_to_many :users

  belongs_to :finance_approver, class_name: "User"
  
  validates_presence_of :name
  validates_uniqueness_of :name
end

