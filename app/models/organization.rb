class Organization < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  belongs_to :user
  has_and_belongs_to_many :events

  accepts_nested_attributes_for :events
end

