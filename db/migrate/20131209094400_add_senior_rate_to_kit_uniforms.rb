class AddSeniorRateToKitUniforms < ActiveRecord::Migration
  def change
    add_column :kit_uniforms, :senior_rate, :integer
  end
end
