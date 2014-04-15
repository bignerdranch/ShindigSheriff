class Organization < ActiveRecord::Base
  has_and_belongs_to_many :events
  accepts_nested_attributes_for :events

  belongs_to :finance_approver, class_name: 'User'
  belongs_to :user

  has_many :expenses, through: :events
  has_many :incomes, through: :events

  validates :name, presence: true, uniqueness: true

  def user
    User.find(user_id)
  end

end
