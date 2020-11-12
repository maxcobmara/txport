class AddColumnToVehicleNo < ActiveRecord::Migration
  def change
    add_column :vehicle_nos, :civil_no, :string
  end
end
