class AddTimestampsToVehicleEndOfLife < ActiveRecord::Migration
  def change
    add_column :vehicle_end_of_lives, :created_at, :datetime
    add_column :vehicle_end_of_lives, :updated_at, :datetime
  end
end