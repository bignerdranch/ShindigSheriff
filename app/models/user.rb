class User < ActiveRecord::Base
  
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email

  has_many :organizations
  accepts_nested_attributes_for :organizations

  has_many :events, through: :organizations

end

