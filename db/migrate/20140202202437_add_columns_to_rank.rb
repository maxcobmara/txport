class AddColumnsToRank < ActiveRecord::Migration
  def change
    add_column :ranks, :category, :integer
    add_column :ranks, :rate, :integer
  end
end
