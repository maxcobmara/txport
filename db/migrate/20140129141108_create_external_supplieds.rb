class CreateExternalSupplieds < ActiveRecord::Migration
  def change
    create_table :external_supplieds do |t|
      t.integer :unit_fuel_id
      t.integer :fuel_type_id
      t.integer :unit_type_id
      t.decimal :quantity
      t.integer :source

      t.timestamps
    end
  end
end
