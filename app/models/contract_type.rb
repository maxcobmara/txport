class ContractType < ActiveRecord::Base
  has_many :contracts, foreign_key: "contract_type"
end

# == Schema Information
#
# Table name: contract_types
#
#  created_at  :datetime
#  description :string(255)
#  id          :integer          not null, primary key
#  short_name  :string(255)
#  updated_at  :datetime
#
