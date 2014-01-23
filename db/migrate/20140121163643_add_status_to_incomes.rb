class AddStatusToIncomes < ActiveRecord::Migration
  def change
    add_column :incomes, :status, :boolean, :null => false, :default => false
  end
end
