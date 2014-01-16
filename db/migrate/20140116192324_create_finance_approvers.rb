class CreateFinanceApprovers < ActiveRecord::Migration
  def change
    create_table :finance_approvers do |t|
      t.references :user
      t.references :organization, unique: true

      t.timestamps
    end

    add_index :finance_approvers, [:user_id, :organization_id], unique: true
  end
end
