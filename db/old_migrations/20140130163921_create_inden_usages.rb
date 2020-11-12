class CreateIndenUsages < ActiveRecord::Migration
  def change
    create_table :inden_usages do |t|
      t.integer :inden_card_id
      t.decimal :petrol_ltr
      t.decimal :petrol_price
      t.decimal :diesel_ltr
      t.decimal :diesel_price
      t.date :issue_date

      t.timestamps
    end
  end
end
