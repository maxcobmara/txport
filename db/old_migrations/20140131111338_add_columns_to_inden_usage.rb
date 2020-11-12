class AddColumnsToIndenUsage < ActiveRecord::Migration
  def change
    add_column :inden_usages, :petronas_p_ltr, :decimal
    add_column :inden_usages, :petronal_p_price, :decimal
    add_column :inden_usages, :petronas_d_ltr, :decimal
    add_column :inden_usages, :petronas_d_price, :decimal
  end
end
