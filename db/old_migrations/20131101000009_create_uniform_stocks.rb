class CreateUniformStocks < ActiveRecord::Migration
  def change
    create_table :uniform_stocks do |t|
      t.integer :uniform_id
      t.decimal :size
      t.string :category
      t.integer :max_quantity
      t.integer :min_quantity
      t.integer :unit_type_id
      t.timestamps
    end
    
    create_table :uniform_stock_receiveds do |t|
      t.integer :stock_id
      t.integer :quantity
      t.decimal :size
      t.date :received_on
      t.integer :received_by
      t.integer :contract_id
      t.timestamps
    end
    
    create_table :uniform_stock_issues do |t|
      t.integer :stock_id
      t.integer :issued_to
      t.integer :issued_by
      t.date :issued_on
      t.integer :quantity
      t.integer :document_id
      t.timestamps
    end
  end
end