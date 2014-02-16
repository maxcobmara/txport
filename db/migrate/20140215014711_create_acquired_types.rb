class CreateAcquiredTypes < ActiveRecord::Migration
  def change
    create_table :acquired_types do |t|
      t.string :short_name, :limit => 12
      t.string :description

      t.timestamps
    end
  end
end
