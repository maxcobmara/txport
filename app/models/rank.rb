class Rank < ActiveRecord::Base
	has_many :staffs, dependent: :nullify
  
  RATE = [
             #  Displayed       stored in db
             ["Junior Rate", 1],
             ["Senior Rate", 2],
             ["Kadet Kanan & Ke Bawah", 3],
             ["Leftenan Muda & Ke Atas", 4]
           ]

  CATEGORY = [
            #  Displayed       stored in db
              ["Lain-Lain Pangkat", 1],
              ["Pegawai", 2]
           ]         
  
end

# == Schema Information
#
# Table name: ranks
#
#  category   :integer
#  created_at :datetime
#  id         :integer          not null, primary key
#  name       :string(255)
#  rate       :integer
#  shortname  :string(255)
#  updated_at :datetime
#
