class FixColumnToUnits2 < ActiveRecord::Migration
  def change
    add_column    :units, :code, :string
    add_column    :units, :combo_code, :string
    add_column    :units, :ancestry_depth, :integer
  end
end
