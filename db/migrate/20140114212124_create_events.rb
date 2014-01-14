class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

      t.string :name
      t.references :organization
      t.date :date 
      t.time :time
      t.string :location
      t.text :purpose

      t.timestamps
    end
  end
end

