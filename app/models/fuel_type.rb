class FuelType < ActiveRecord::Base
  has_many :fuel_tanks, :foreign_key => "fuel_type_id"
  has_many :fuel_issueds, dependent: :nullify
  has_many :fuel_supplieds, dependent: :nullify
  has_many :add_fuels, dependent: :nullify
  
  def self.exclude_petrol_diesel
    where('name LIKE (?) OR name LIKE (?)','PETROL','DIESEL').pluck(:id)
  end
end
