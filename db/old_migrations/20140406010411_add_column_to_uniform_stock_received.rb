class AddColumnToUniformStockReceived < ActiveRecord::Migration
  def change
    add_column :uniform_stock_receiveds, :rv_no, :string
  end
end
