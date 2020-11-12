class AddColumn2ToVehicleNo < ActiveRecord::Migration
  def change
    add_column :vehicle_nos, :vehicle_army_id, :integer
  end
end
