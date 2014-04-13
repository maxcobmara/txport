class MaintenanceDetail < ActiveRecord::Base
  belongs_to :maintenance
  belongs_to :maintenance_type
  belongs_to :unittype, :class_name => "UnitType", :foreign_key => "unit_type" #avoid use of same name for relationship & field name (FK)
  
  def line_item_totals
    line_item_price * quantity
  end

  #did not works in helper
  def self.get_quantity(mparts)
    fulldesc_arr = mparts.split(" ")                        # ["partsA", "01nos"] if ..... partsA 01nos   @ "partsA 01 nos"
    last_item = fulldesc_arr[fulldesc_arr.count-1]          # "01nos"                                     @ "nos"
    second_last_item = fulldesc_arr[fulldesc_arr.count-2]
    qty_type_arr = last_item.scan(/\d+|\D+/)                # ["01", "nos"]                               @ "nos"
    qty_type_arr_count = qty_type_arr.count                 # ["01", "nos"].count ==> 2                   @ 1
    if qty_type_arr_count>1    
      qty = qty_type_arr[0].to_i
    else
      qty = second_last_item.to_i
    end
    qty
  end 

end

# == Schema Information
#
# Table name: maintenance_details
#
#  created_at          :datetime
#  id                  :integer          not null, primary key
#  line_item           :string(255)
#  line_item_price     :decimal(, )
#  maintenance_id      :integer
#  maintenance_type_id :integer
#  quantity            :integer
#  unit_type           :integer
#  updated_at          :datetime
#
