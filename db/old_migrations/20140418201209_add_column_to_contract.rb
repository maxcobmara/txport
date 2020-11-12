class AddColumnToContract < ActiveRecord::Migration
  def change
    add_column :contracts, :category, :integer
  end
end
