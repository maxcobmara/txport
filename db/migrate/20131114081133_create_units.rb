class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :shortname
      t.string :name
      t.integer :parent_id

      t.timestamps
    end
  end
end
