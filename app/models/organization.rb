class Organization < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  belongs_to :user
  has_and_belongs_to_many :events
  has_one :finance_approver

  accepts_nested_attributes_for :events

  def finance_app_user
    finance_approver.user
  end

end

