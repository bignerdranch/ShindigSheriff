class AddTimestampsToEventsOrganizations < ActiveRecord::Migration
  def change
    add_column :events_organizations, :created_at, :datetime
    add_column :events_organizations, :updated_at, :datetime
  end
end
