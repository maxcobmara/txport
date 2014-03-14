class MaintenanceDetail < ActiveRecord::Base
  belongs_to :maintenance, :foreign_key => "maintenance_id"
  belongs_to :maintenance_type, :foreign_key => "maintenance_type_id"
  belongs_to :unittype, :class_name => "UnitType", :foreign_key => "unit_type" #avoid use of same name for relationship & field name (FK)
  
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
