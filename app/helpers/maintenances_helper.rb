module MaintenancesHelper
  
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
  
  def category(id)
    (DropDown::MAINTENANCE_TYPES.find_all{|disp, value| value == id}).map {|disp, value| disp }[0] rescue 0
  end
  
  def supply_totals(id)
    #Todo: refactor into one query
    prices =      MaintenanceDetail.where(maintenance_id: id).where(maintenance_type_id: 1).order(id: :asc).pluck(:line_item_price)
    quantities =  MaintenanceDetail.where(maintenance_id: id).where(maintenance_type_id: 1).order(id: :asc).pluck(:quantity)
    sum = (0...prices.count).inject(0) {|r, i| r + prices[i]*quantities[i]}
    ringgols(sum)
  end
  
  def repair_totals(id)
    prices =      MaintenanceDetail.where(maintenance_id: id).where(maintenance_type_id: 2).order(id: :asc).pluck(:line_item_price)
    quantities =  MaintenanceDetail.where(maintenance_id: id).where(maintenance_type_id: 2).order(id: :asc).pluck(:quantity)
    sum = (0...prices.count).inject(0) {|r, i| r + prices[i]*quantities[i]}
    ringgols(sum)
  end
end
