class DropUnusedIndexFromOrganizationsAndEvents < ActiveRecord::Migration
  def change
    remove_column :organizations, :event_id, :integer
    remove_column :events, :organization_id, :integer
  end
end
