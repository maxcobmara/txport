class CreateMaintenanceTypes < ActiveRecord::Migration
  def change
    create_table :maintenance_types do |t|
      t.string :type_name
      t.string :description

      t.timestamps
    end
  end
end
