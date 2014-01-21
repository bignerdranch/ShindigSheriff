class User < ActiveRecord::Base
  
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email

  has_many :events, through: :organizations
  has_many :incomes, through: :events

  has_many :organizations
  accepts_nested_attributes_for :organizations

  has_many :organizations_as_finance_approver_role, class_name: 'FinanceApprover',
          foreign_key: 'finance_approver_id'

  def info
    "#{first_name.capitalize!} #{last_name.capitalize!} : #{email}"
  end

  def finance_approver?
    FinanceApproverRole.find_by_user_id(id)
  end
  
end

