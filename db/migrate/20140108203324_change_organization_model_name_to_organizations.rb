class ChangeOrganizationModelNameToOrganizations < ActiveRecord::Migration
  def change
  	rename_table :organization_models, :organizations
  end
end
