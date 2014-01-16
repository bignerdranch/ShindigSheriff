class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|

      t.references :event
      t.decimal :estimated_amount
      t.decimal :actual_amount
      t.date  :date_received
      t.text  :category_details

      t.timestamps
    end
  end
end
