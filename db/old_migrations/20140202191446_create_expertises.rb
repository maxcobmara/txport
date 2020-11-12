class CreateExpertises < ActiveRecord::Migration
  def change
    create_table :expertises do |t|
      t.string :short_name
      t.string :name
      t.integer :branch

      t.timestamps
    end
  end
end
