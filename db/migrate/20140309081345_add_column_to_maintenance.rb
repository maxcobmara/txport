class AddColumnToMaintenance < ActiveRecord::Migration
  def change
    add_column :maintenances, :maintenance_date, :date
  end
end
