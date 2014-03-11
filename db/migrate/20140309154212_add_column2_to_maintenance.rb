class AddColumn2ToMaintenance < ActiveRecord::Migration
  def change
    add_column :maintenances, :value_supplied, :decimal
    add_column :maintenances, :value_repaired, :decimal
  end
end
