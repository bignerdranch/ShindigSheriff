class User < ActiveRecord::Base

  validates_presence_of :first_name, :last_name, :email, :password
  validates_uniqueness_of :email
  has_many :organizations
  accepts_nested_attributes_for :organizations

end

