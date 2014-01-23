class CreateRolesUsers < ActiveRecord::Migration
  def change
    create_table :roles_users do |t|
      t.references :role 
      t.references :user 
    end

    remove_column :roles, :user_id
  end
end