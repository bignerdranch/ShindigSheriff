class User < ActiveRecord::Base
  
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name, :email, :roles
  validates_uniqueness_of :email

  has_many :events, through: :organizations
  has_many :incomes, through: :events

  has_many :organizations
  accepts_nested_attributes_for :organizations

  has_and_belongs_to_many :roles
  accepts_nested_attributes_for :roles

  validate :organizers_should_have_organization

  has_many :approver_organizations, class_name: "Organization", foreign_key: :finance_approver_id


  # Finance Approver Incomes
   def all_incomes
     approver_organizations.map(&:incomes).flatten
   end

  # User Verification
  def verify
    self.update_attributes(verified: true)
  end

  # Finance Approver Select
  def info
    "#{display_name} : #{email}"
  end

  def display_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  # User currently has one role, but may have many in the future
  def has_role? name
    roles.pluck(:name).include?(name)
  end
  
  def role= name
    role = Role.find_by_name(name)
    self.roles << role if role
  end

  private 

  def organizers_should_have_organization
    if has_role? "organizer" && organizations.blank?
      errors[:organization] = "can't be blank"
    end
  end

end

