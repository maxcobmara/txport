class CreateDepotFuels < ActiveRecord::Migration
  def change
    create_table :depot_fuels do |t|
      t.integer :unit_id
      t.date :issue_date

      t.timestamps
    end
  end
end
