class AddColumnsToVehicleAssignmentDetails < ActiveRecord::Migration
  def change
    add_column :vehicle_assignment_details, :release_no, :string
    add_column :vehicle_assignment_details, :release_type, :integer
    add_column :vehicle_assignment_details, :remark, :string
  end
end
