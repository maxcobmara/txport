class FuelType < ActiveRecord::Base
  has_many :fuel_tanks, :foreign_key => "fuel_type_id"
  has_many :fuel_issueds, dependent: :nullify
  has_many :fuel_supplieds, dependent: :nullify
end
