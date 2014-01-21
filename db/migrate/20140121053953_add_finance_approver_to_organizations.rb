class AddFinanceApproverToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :finance_approver_id, :integer
    add_index :organizations, :finance_approver_id
  end
end
