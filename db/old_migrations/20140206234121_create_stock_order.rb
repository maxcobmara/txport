class CreateStockOrder < ActiveRecord::Migration
  def change
    create_table :stock_orders do |t|
      t.integer :stock_id
      t.integer :quantity
      t.integer :unit_type_id
      t.integer :company_id
      t.string :remark
    end
  end
end
