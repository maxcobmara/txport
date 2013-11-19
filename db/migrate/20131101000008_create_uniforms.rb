class CreateUniforms < ActiveRecord::Migration
  def change
    create_table :uniform_items do |t|
      t.string :code
      t.string :name
      t.text :notes
      t.timestamps
    end
    
    create_table :kits do |t|
      t.string :code
      t.string :combo_code
      t.string :name
      t.string :ancestry
      t.integer :ancestry_depth
      t.timestamps
    end
    
    create_table :kit_uniforms do |t|
      t.integer :kit_id
      t.integer :uniform_id
      t.integer :quantity
      t.string :notes
      t.timestamps
    end
  end
end