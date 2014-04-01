class CreateVehicleEndOfLife < ActiveRecord::Migration
  def change
    create_table :vehicle_end_of_lifes do |t|
      t.integer :vehicle_id
      t.string  :status
      t.string  :confirmation_code
      t.date    :confirmed_on
      t.string  :data
     end
  end
end
