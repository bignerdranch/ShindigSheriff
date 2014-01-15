class Event < ActiveRecord::Base
  has_and_belongs_to_many :organizations
  has_many :incomes
  validates_presence_of :name, :date, :time, :location, :purpose 
end

