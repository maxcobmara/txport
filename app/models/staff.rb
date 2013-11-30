class Staff < ActiveRecord::Base
	belongs_to :rank, :foreign_key => "rank_id"
end
