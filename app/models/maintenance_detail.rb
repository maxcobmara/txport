class MaintenanceDetail < ActiveRecord::Base
  belongs_to :maintenance
  belongs_to :maintenance_type
  belongs_to :unittype, :class_name => "UnitType", :foreign_key => "unit_type" #avoid use of same name for relationship & field name (FK)
  


end

# == Schema Information
#
# Table name: maintenance_details
#
#  created_at          :datetime
#  id                  :integer          not null, primary key
#  line_item           :string(255)
#  line_item_price     :decimal(, )
#  maintenance_id      :integer
#  maintenance_type_id :integer
#  quantity            :integer
#  unit_type           :integer
#  updated_at          :datetime
#
