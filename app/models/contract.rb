class Contract < ActiveRecord::Base
	has_many :maintenances, :foreign_key => "contract_id"
end
