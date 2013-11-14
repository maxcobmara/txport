class CreateVehicleAssignments < ActiveRecord::Migration
  def change
    create_table :vehicle_assignments do |t|
      t.integer :document_code
      t.date    :document_date
      t.integer :authorised_by

      t.timestamps
    end
    
    create_table :vehicle_assignment_details do |t|
      t.integer :vehicle_assignment_id
      t.integer :vehicle_id
      t.integer :staff_id
      t.date :assigned_on
      t.date :assignment_end

      t.timestamps
    end
  end
end
