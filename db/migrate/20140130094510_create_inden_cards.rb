class CreateIndenCards < ActiveRecord::Migration
  def change
    create_table :inden_cards do |t|
      t.boolean :ru_staff
      t.string :serial_no
      t.decimal :daily_limit
      t.decimal :monthly_limit
      t.date :issue_date
      t.date :start_date
      t.date :end_date
      t.integer :staff_id
      t.integer :unit_id

      t.timestamps
    end
  end
end
