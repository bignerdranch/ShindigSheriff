class Organization < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  has_and_belongs_to_many :events
  accepts_nested_attributes_for :events

  belongs_to :user
  belongs_to :finance_approver, class_name: 'User'

  has_many :incomes, through: :events
  has_many :expenses, through: :events

  def user
    User.find(user_id)
  end

end

