class Contract < ActiveRecord::Base
  before_save :set_category
	has_many :maintenances
	has_many :vehicles
  belongs_to :contractor, class_name: "Company",        foreign_key: "company_id"
  belongs_to :issuer,     class_name: "Staff",          foreign_key: "issued_by"
  belongs_to :type,       class_name: "ContractType",   foreign_key: "contract_type"
  
  scope :transport_contract, -> { where(category: 1) }
  
  def set_category
    if category.nil?
      self.category = 1
    end
  end
  
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
