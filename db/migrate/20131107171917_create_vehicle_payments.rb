class CreateVehiclePayments < ActiveRecord::Migration
  def change
    create_table :vehicle_card_payments do |t|
      t.integer :vehicle_card_id
      t.date :updated_on
      t.decimal :amount
      t.string :receipt_no

      t.timestamps
    end
  end
end
