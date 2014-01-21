class RemoveOrganizationIdFromFinanceApproverRole < ActiveRecord::Migration
  def change
    remove_column :finance_approver_roles, :organization_id
  end
end
