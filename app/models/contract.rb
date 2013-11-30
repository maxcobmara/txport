class Contract < ActiveRecord::Base
	has_many :maintenances
	has_many :vehicles
  belongs_to :contractor, class_name: "Company",        foreign_key: "company_id"
  belongs_to :issuer,     class_name: "Staff",          foreign_key: "issued_by"
  belongs_to :type,       class_name: "ContractType",   foreign_key: "contract_type"
end

