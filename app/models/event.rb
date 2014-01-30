class Event < ActiveRecord::Base
  has_and_belongs_to_many :organizations
  has_many :incomes
  has_many :expenses
  has_many :users, through: :organizations
  
  accepts_nested_attributes_for :organizations

  validates :date,      presence: true
  validates :location,  presence: true
  validates :name,      presence: true
  validates :purpose,   presence: true
  validates :time,      presence: true
  
end

