class Organization < ActiveRecord::Base
  has_many :events_organizations
  has_many :events, through: :events_organizations

  accepts_nested_attributes_for :events

  belongs_to :user
  belongs_to :finance_approver, class_name: 'User'

  has_many :incomes, through: :events
  has_many :expenses, through: :events

  validates :name, presence: true, uniqueness: true

  def user
    User.find(user_id)
  end

end

