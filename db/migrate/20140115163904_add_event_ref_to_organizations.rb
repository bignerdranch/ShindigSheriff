class AddEventRefToOrganizations < ActiveRecord::Migration
  def change
    add_reference :organizations, :event, index: true
  end
end
