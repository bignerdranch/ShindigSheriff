class CreateOrganizationModels < ActiveRecord::Migration
  def change
    create_table :organization_models do |t|
    
      t.references :user

      t.string :name
      t.timestamps  
     
    end
  end
end

