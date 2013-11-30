class VehicleCategory < ActiveRecord::Base
  has_many :vehicles, :foreign_key => "category_id"
end
