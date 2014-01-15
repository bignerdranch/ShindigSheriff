class CreateEventsOrganizations < ActiveRecord::Migration
  def change
    create_table :events_organizations do |t|
      t.belongs_to :event
      t.belongs_to :organization
    end
    remove_column :events, :organization_id, :integer
    remove_column :organizations, :event_id, :integer
  end
end
