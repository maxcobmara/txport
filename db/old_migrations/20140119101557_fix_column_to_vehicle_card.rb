class FixColumnToVehicleCard < ActiveRecord::Migration
  def change
    remove_column :vehicle_cards, :smarttag_serial
    add_column    :vehicle_cards, :smarttag_serial, :string
  end
end
