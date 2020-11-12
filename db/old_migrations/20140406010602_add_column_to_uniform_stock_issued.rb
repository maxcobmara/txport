class AddColumnToUniformStockIssued < ActiveRecord::Migration
  def change
    add_column :uniform_stock_issues, :iv_no, :string
  end
end
