class CreateAddFuels < ActiveRecord::Migration
  def change
    create_table :add_fuels do |t|
      t.integer :unit_fuel_id
      t.integer :fuel_type_id
      t.string :description
      t.decimal :quantity
      t.integer :unit_type_id

      t.timestamps
    end
  end
end
