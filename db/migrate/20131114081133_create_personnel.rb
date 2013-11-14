class CreatePersonnel < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :shortname
      t.string :name
      t.integer :parent_id

      t.timestamps
    end
    
    create_table :staffs do |t|
      t.string :id_no
      t.integer :rank_id
      t.string :name

      t.timestamps
    end
  end
end
