class FixColumnToUnits < ActiveRecord::Migration
  def change
    remove_column :units, :parent_id
    add_column    :units, :ancestry, :string
  end
end
