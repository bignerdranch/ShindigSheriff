class User < ActiveRecord::Base
  
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email

  has_many :events, through: :organizations
  has_many :incomes, through: :events

  has_many :organizations
  accepts_nested_attributes_for :organizations

  has_one :organizations_as_role, class_name: 'FinanceApprover',
          foreign_key: 'finance_approver_id'

  has_and_belongs_to_many :roles

  def info
    "#{first_name.capitalize} #{last_name.capitalize} : #{email}"
  end

  def has_role?(name)
    roles.pluck(:name).include?(name)
  end
  
end