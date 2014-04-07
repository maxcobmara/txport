class VehicleEndOfLife < ActiveRecord::Base

  belongs_to :vehicle, touch: true
  
end

# == Schema Information
#
# Table name: vehicle_end_of_lives
#
#  confirmation_code :string(255)
#  confirmed_on      :date
#  data              :string(255)
#  id                :integer          not null, primary key
#  status            :string(255)
#  vehicle_id        :integer
#
