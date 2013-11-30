class Company < ActiveRecord::Base
	has_many :repairs,  :class_name => "Maintenances", :foreign_key => "repaired_by"
	has_many :supplies, :class_name => "Maintenances", :foreign_key => "repaired_by"
end
