class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string  :reg_no
      t.string  :chassis_no
      t.string  :engine_no
      t.date    :reg_on
      t.date    :manufacturer_year
      t.integer :manufacturer_id
      t.string  :model
      t.integer :category_id
      t.date    :acquired_on
      t.decimal :price
      t.integer :contract_id
      t.integer :status_id

      t.timestamps
    end
  end
end
