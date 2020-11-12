class AddColumnsToStaff < ActiveRecord::Migration
  def change
    add_column :staffs, :expertise_id, :integer
    add_column :staffs, :position_id, :integer
    add_column :staffs, :gender, :integer
    add_column :staffs, :religion, :integer
  end
end
