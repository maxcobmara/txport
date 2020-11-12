class AddColumnToMaintenanceDetail < ActiveRecord::Migration
  def change
    add_column :maintenance_details, :maintenance_type_id, :integer
  end
end
