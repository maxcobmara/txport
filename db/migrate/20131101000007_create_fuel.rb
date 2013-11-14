class CreateFuel < ActiveRecord::Migration
  def change
    create_table :fuel_tanks do |t|
      t.integer :unit_id
      t.string :locations
      t.decimal :capacity
      t.integer :unit_type
      t.integer :fuel_type_id
      t.timestamps
    end
    
    create_table :fuel_types do |t|
      t.string :shortname
      t.string :name
      t.timestamps
    end
  end
end
