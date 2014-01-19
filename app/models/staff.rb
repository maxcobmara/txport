class Staff < ActiveRecord::Base
  has_many :contracts,                            foreign_key: "issued_by"
  has_many :authorisations, class_name: "Staff",  foreign_key: "authorised_by"
	belongs_to :rank, :foreign_key => "rank_id" 
  has_one :vehicle_card, dependent: :nullify
  
  def staff_details
    "#{id_no} " + "#{name}"
  end
end
