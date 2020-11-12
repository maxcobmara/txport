class CreateFuelSupplieds < ActiveRecord::Migration
  def change
    create_table :fuel_supplieds do |t|
      t.integer :depot_fuel_id
      t.integer :fuel_type_id
      t.decimal :quantity
      t.integer :unit_type_id

      t.timestamps
    end
  end
end
