class AddColumnToFuelIssued < ActiveRecord::Migration
  def change
    add_column :fuel_issueds, :unit_type_id, :integer
  end
end
