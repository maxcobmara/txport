class CreateVehicleSupports < ActiveRecord::Migration
  def change
    create_table :vehicle_road_taxes do |t|
      t.integer :vehicle_id
      t.date :start_on
      t.date :end_on
      t.decimal :amount

      t.timestamps
    end
    
    create_table :vehicle_fines do |t|
      t.string :code
      t.integer :vehicle_id
      t.integer :type_id
      t.datetime :issued_at
      t.date :pay_before
      t.string :location
      t.string :reason
      t.decimal :compound
      t.string :receipt_no
      t.date :paid_on
      t.decimal :paid_amount

      t.timestamps
    end
    
    create_table :vehicle_fine_types do |t|
      t.string :short_name
      t.string :description

      t.timestamps
    end
    
    create_table :vehicle_cards do |t|
      t.integer :vehicle_id
      t.string :serial_no

      t.timestamps
    end
  end
end
