class Event < ActiveRecord::Base
  has_and_belongs_to_many :organizations
  validates_presence_of :name, :date, :time, :location, :purpose 

   accepts_nested_attributes_for :organizations
end

