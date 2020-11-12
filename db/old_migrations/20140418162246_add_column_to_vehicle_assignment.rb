class AddColumnToVehicleAssignment < ActiveRecord::Migration
  def change
    add_column :vehicle_assignments, :authorising_unit, :integer
  end
end
