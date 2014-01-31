class IndenUsage < ActiveRecord::Base
  belongs_to :inden_card, foreign_key: "inden_card_id"
end
