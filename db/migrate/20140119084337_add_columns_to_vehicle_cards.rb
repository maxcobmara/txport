class AddColumnsToVehicleCards < ActiveRecord::Migration
  def change
    add_column :vehicle_cards, :staff_id, :integer
    add_column :vehicle_cards, :unit_id, :integer
    add_column :vehicle_cards, :smart_tag, :boolean
    add_column :vehicle_cards, :smarttag_serial, :integer
    add_column :vehicle_cards, :issue_date, :date
    add_column :vehicle_cards, :start_date, :date
    add_column :vehicle_cards, :expired_date, :date
  end
end
