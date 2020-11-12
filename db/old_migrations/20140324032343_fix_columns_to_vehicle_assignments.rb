class FixColumnsToVehicleAssignments < ActiveRecord::Migration
  def change
	remove_column :vehicle_assignments, :document_code
	add_column    :vehicle_assignments, :document_code, :string
	add_column    :vehicle_assignments, :unit_id, :integer
  end
end
