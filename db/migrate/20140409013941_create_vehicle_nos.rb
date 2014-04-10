class CreateVehicleNos < ActiveRecord::Migration
  def change
    create_table :vehicle_nos do |t|
      t.date :start_on
      t.date :end_on
      t.integer :vehicle_id

      t.timestamps
    end
  end
end
