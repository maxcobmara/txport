class Staff < ActiveRecord::Base
  has_many :contracts,   foreign_key: "issued_by"
	belongs_to :rank, :foreign_key => "rank_id"  
end
