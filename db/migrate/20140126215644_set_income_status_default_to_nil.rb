class SetIncomeStatusDefaultToNil < ActiveRecord::Migration
  def up
      change_column :incomes, :status, :boolean, :default => nil, :null => true
  end

  def down
      change_column :incomes, :status, :boolean, :default => false, :null => false
  end
end
