class AddColumnToFuelBalance < ActiveRecord::Migration
  def change
    add_column :fuel_balances, :unit_type_id, :integer
  end
end
