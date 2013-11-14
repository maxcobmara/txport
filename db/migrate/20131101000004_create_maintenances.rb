class CreateMaintenances < ActiveRecord::Migration
  def change
    create_table :maintenances do |t|
      t.integer :vehicle_id
      t.string :work_order_no
      t.integer :contract_id
      t.integer :repaired_by
      t.integer :supplied_by

      t.timestamps
    end
    
    create_table :maintenance_details do |t|
      t.integer :maintenance_id
      t.string :line_item
      t.decimal :line_item_price
      t.integer :quantity
      t.integer :unit_type

      t.timestamps
    end
    
    create_table :unit_types do |t|
      t.string :short_name
      t.string :description

      t.timestamps
    end
  end
end
