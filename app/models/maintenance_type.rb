class MaintenanceType < ActiveRecord::Base
  has_many :maintenance_details
end
