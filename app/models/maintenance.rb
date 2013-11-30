class Maintenance < ActiveRecord::Base
	belongs_to :vehicle
  belongs_to :contract
	belongs_to :repairer, :class_name => "Company", :foreign_key => "repaired_by"
	belongs_to :supplier, :class_name => "Company", :foreign_key => "supplied_by"
	
end
