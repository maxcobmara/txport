class CreateVehicleArmies < ActiveRecord::Migration
  def change
    create_table :vehicle_armies do |t|
      t.string :v_army_no

      t.timestamps
    end
  end
end
