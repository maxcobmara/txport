class Maintenance < ActiveRecord::Base
	belongs_to :vehicle
	belongs_to :repairer, :class_name => "companies", :foreign_key => "repaired_by"
	belongs_to :supplier, :class_name => "companies", :foreign_key => "supplier_by"
	belongs_to :contract, :foreign_key => "contract_id"
end
