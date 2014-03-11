class Maintenance < ActiveRecord::Base
	belongs_to :vehicle
  belongs_to :contract
	belongs_to :repairer, :class_name => "Company", :foreign_key => "repaired_by"
	belongs_to :supplier, :class_name => "Company", :foreign_key => "supplied_by"
  has_many :maintenance_details, dependent: :destroy
  accepts_nested_attributes_for :maintenance_details, allow_destroy: true, reject_if: proc { |maintenance_details| maintenance_details[:quantity].blank? }
end

