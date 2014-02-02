class AddColumToKitUniform < ActiveRecord::Migration
  def change
    add_column :kit_uniforms, :staff_group, :integer
  end
end
