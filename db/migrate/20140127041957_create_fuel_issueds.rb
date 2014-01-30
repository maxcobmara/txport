class CreateFuelIssueds < ActiveRecord::Migration
  def change
    create_table :fuel_issueds do |t|
      t.integer :depot_fuel_id
      t.integer :fuel_type_id
      t.decimal :quantity

      t.timestamps
    end
  end
end
