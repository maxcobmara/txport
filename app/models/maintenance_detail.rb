class MaintenanceDetail < ActiveRecord::Base
  belongs_to :maintenance, :foreign_key => "maintenance_id"
  belongs_to :maintenance_type, :foreign_key => "maintenance_type_id"
  belongs_to :unittype, :class_name => "UnitType", :foreign_key => "unit_type" #avoid use of same name for relationship & field name (FK)
end
