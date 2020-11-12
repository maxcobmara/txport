class CreateFuelBalances < ActiveRecord::Migration
  def change
    create_table :fuel_balances do |t|
      t.integer :depot_fuel_id
      t.integer :fuel_tank_id
      t.decimal :current

      t.timestamps
    end
  end
end
