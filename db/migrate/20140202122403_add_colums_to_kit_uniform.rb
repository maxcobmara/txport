class AddColumsToKitUniform < ActiveRecord::Migration
  def change
    add_column :kit_uniforms, :pk, :integer
    add_column :kit_uniforms, :pkk, :integer
    add_column :kit_uniforms, :graduan, :integer
    add_column :kit_uniforms, :peg_l, :integer
    add_column :kit_uniforms, :peg_p, :integer
    add_column :kit_uniforms, :peg, :integer
    add_column :kit_uniforms, :kadet_l, :integer
    add_column :kit_uniforms, :kadet_p, :integer
    add_column :kit_uniforms, :quantity2, :integer
  end
end
