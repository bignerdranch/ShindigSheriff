class DropEventsOrganizations < ActiveRecord::Migration
  def change
     drop_table :events_organizations
  end
  def change
    add_reference :organizations, :event, index: true
    add_reference :events, :organization, index: true
  end
end
