class AddReferenceToIncomes < ActiveRecord::Migration
  def change
    add_reference :incomes, :category, index: true, null: false
  end
end
