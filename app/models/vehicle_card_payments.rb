class VehicleCardPayments < ActiveRecord::Base
end

# == Schema Information
#
# Table name: vehicle_card_payments
#
#  amount          :decimal(, )
#  created_at      :datetime
#  id              :integer          not null, primary key
#  receipt_no      :string(255)
#  updated_at      :datetime
#  updated_on      :date
#  vehicle_card_id :integer
#
