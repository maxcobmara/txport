class ChangeVehicleToLimit20 < ActiveRecord::Migration
  def change
     change_column :vehicles, :reg_no, :string, :limit => 20
  end
end
