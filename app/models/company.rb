class Company < ActiveRecord::Base
	has_many :maintenances, :foreign_key => "repaired_by"
	has_many :maintenances, :foreign_key => "supplier_by"
end
