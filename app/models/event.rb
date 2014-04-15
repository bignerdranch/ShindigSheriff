class Event < ActiveRecord::Base
  has_and_belongs_to_many :organizations
  has_many :incomes
  has_many :expenses
  has_many :users, through: :organizations

  accepts_nested_attributes_for :organizations

  validates_presence_of :name, :date, :time, :location, :purpose

end

