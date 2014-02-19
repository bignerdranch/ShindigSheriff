class UpdateNamePresenceForOrganizations < ActiveRecord::Migration
  def change
    change_column_null :organizations, :name, false
  end
end

