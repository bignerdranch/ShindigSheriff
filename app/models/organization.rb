class Organization < ActiveRecord::Base

  belongs_to :finance_approver, class_name: 'User'
  belongs_to :user

  has_many :events_organizations
  has_many :events, through: :events_organizations

  accepts_nested_attributes_for :events

  has_many :expenses, through: :events
  has_many :incomes, through: :events

  validates :name, presence: true, uniqueness: true

  def user
    User.find(user_id)
  end

end
