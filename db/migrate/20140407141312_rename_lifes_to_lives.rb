class RenameLifesToLives < ActiveRecord::Migration
  def change
    rename_table :vehicle_end_of_lifes, :vehicle_end_of_lives
  end
end
