class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.string :id_no
      t.integer :rank_id
      t.string :name

      t.timestamps
    end
  end
end
