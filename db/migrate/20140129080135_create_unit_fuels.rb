class CreateUnitFuels < ActiveRecord::Migration
  def change
    create_table :unit_fuels do |t|
      t.date :issue_date
      t.integer :unit_id
      t.decimal :d_vessel
      t.decimal :d_vehicle
      t.decimal :d_misctool
      t.decimal :d_boat
      t.decimal :p_vehicle
      t.decimal :p_misctool
      t.decimal :p_boat

      t.timestamps
    end
  end
end
