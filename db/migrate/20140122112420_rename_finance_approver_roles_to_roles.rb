class RenameFinanceApproverRolesToRoles < ActiveRecord::Migration
  def change
    rename_table :finance_approver_roles, :roles
  end
end
