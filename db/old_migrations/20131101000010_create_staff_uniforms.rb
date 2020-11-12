class CreateStaffUniforms < ActiveRecord::Migration
  def change
    create_table :staff_measurements do |t|
      t.integer :staff_id
      t.integer :uniform_id
      t.string :measurement_type
      t.decimal :value
      t.integer :unit_type_id
      t.timestamps
    end
    
    create_table :kit_staffs do |t|
      t.integer :kit_id
      t.integer :staff_id
      t.integer :staff_group_id
      t.timestamps
    end
  end
end