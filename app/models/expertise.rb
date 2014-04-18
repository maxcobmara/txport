class Expertise < ActiveRecord::Base
  has_many :staffs, dependent: :nullify
  
  BRANCH = [
             #  Displayed       stored in db
             ["Cawangan Pelaut", 1],
             ["Cawangan Bekalan dan Urusetia", 2],
             ["Cawangan Teknikal", 3]
  ]
  
  def expertise_details
    "#{short_name}"+" - "+"#{name}"
  end
  
end

# == Schema Information
#
# Table name: expertises
#
#  branch     :integer
#  created_at :datetime
#  id         :integer          not null, primary key
#  name       :string(255)
#  short_name :string(255)
#  updated_at :datetime
#
