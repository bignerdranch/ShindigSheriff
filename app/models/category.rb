class Category < ActiveRecord::Base
  has_many :incomes

  validates :name, presence: true, uniqueness: true
end

