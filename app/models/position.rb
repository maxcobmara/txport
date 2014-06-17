class Position < ActiveRecord::Base
  has_many :staffs, dependent: :nullify
end

# == Schema Information
#
# Table name: positions
#
#  created_at :datetime
#  id         :integer          not null, primary key
#  name       :string(255)
#  updated_at :datetime
#
