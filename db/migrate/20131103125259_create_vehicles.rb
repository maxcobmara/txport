class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string  :reg_no, :limit => 8
      t.string  :chassis_no
      t.string  :engine_no
      t.date    :reg_on
      t.string  :manufacturer_year
      t.integer :manufacturer_id
      t.string  :model
      t.integer :category_id
      t.date    :acquired_on
      t.decimal :price, :precision => 10, :scale => 2
      t.integer :contract_id
      t.integer :status_id

      t.timestamps
    end
    
    create_table :vehicle_statuses do |t|
      t.string  :shortname, :limit => 12
      t.string  :description
      t.timestamps
    end
    
    create_table :vehicle_categories do |t|
      t.string  :shortname, :limit => 12
      t.string  :description
      t.timestamps
    end
    
    create_table :vehicle_manufacturers do |t|
      t.string  :name
      t.string  :country
      t.timestamps
    end
    
    
  end
end
