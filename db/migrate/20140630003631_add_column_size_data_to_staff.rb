class AddColumnSizeDataToStaff < ActiveRecord::Migration
  def change
    add_column :staffs, :size_data, :text
  end
end
