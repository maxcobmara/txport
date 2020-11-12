class AddColumnToFuelTanks < ActiveRecord::Migration
  def change
    add_column :fuel_tanks, :maximum, :decimal
  end
end
