class AddColumn3ToMaintenance < ActiveRecord::Migration
  def change
    add_column :maintenances, :repair_date, :date
    add_column :maintenances, :repair_location, :string
  end
end
