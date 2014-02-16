class AddColumnToVehicle < ActiveRecord::Migration
  def change
    add_column :vehicles, :acquired_id, :integer
  end
end
