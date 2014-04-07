class Contract < ActiveRecord::Base
	has_many :maintenances
	has_many :vehicles
  belongs_to :contractor, class_name: "Company",        foreign_key: "company_id"
  belongs_to :issuer,     class_name: "Staff",          foreign_key: "issued_by"
  belongs_to :type,       class_name: "ContractType",   foreign_key: "contract_type"
end

# == Schema Information
#
# Table name: contracts
#
#  company_id    :integer
#  contract_no   :string(255)
#  contract_type :integer
#  created_at    :datetime
#  description   :text
#  ends_on       :date
#  id            :integer          not null, primary key
#  issued_by     :integer
#  name          :string(255)
#  starts_on     :date
#  updated_at    :datetime
#  value         :decimal(, )
#
