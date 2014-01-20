class RenameFinanceApproversToFinanceApproverRoles < ActiveRecord::Migration
  def change
    rename_table :finance_approvers, :finance_approver_roles
  end
end
