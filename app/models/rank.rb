class Rank < ActiveRecord::Base
	has_many :staffs, :foreign_key => "rank_id"
end
