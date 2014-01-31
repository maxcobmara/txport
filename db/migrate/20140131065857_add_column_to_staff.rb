class AddColumnToStaff < ActiveRecord::Migration
  def change
    add_column :staffs, :unit_id, :integer
  end
end
