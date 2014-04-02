class Staff < ActiveRecord::Base
  has_many :contracts,                            foreign_key: "issued_by"
  has_many :authorisations, class_name: "Staff",  foreign_key: "authorised_by"
	belongs_to :rank, :foreign_key => "rank_id" 
  has_one :vehicle_card, dependent: :nullify
  belongs_to :unit, foreign_key: "unit_id"
  has_many :inden_cards, dependent: :nullify  #1 card only
  
  def staff_details
    "#{id_no} " + "#{name}".gsub(/\w+/, &:capitalize)
  end
end

# == Schema Information
#
# Table name: staffs
#
#  created_at   :datetime
#  expertise_id :integer
#  gender       :integer
#  id           :integer          not null, primary key
#  id_no        :string(255)
#  name         :string(255)
#  position_id  :integer
#  rank_id      :integer
#  religion     :integer
#  unit_id      :integer
#  updated_at   :datetime
#
