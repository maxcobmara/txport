module MaintenancesHelper
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
