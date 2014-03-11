class UnitType < ActiveRecord::Base
  has_many :fuel_tanks, :foreign_key => "unit_type"
  has_many :fuel_issueds, dependent: :nullify
  has_many :fuel_supplieds, dependent: :nullify
  has_many :fuel_balances, dependent: :nullify
  has_many :add_fuels, dependent: :nullify
  has_many :external_issueds, dependent: :nullify
  has_many :external_supplieds, dependent: :nullify
  has_many :maintenance_details, dependent: :nullify
end
