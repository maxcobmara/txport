class DepotFuel < ActiveRecord::Base
  belongs_to :depot, class_name: "Unit", :foreign_key => "unit_id"
  has_many :fuel_issueds, dependent: :destroy
  accepts_nested_attributes_for :fuel_issueds, allow_destroy: true, reject_if: proc { |fuel_issueds| fuel_issueds[:quantity].blank? }
  has_many :fuel_supplieds, dependent: :destroy
  accepts_nested_attributes_for :fuel_supplieds, allow_destroy: true, reject_if: proc { |fuel_supplieds| fuel_supplieds[:quantity].blank? }
  has_many :fuel_balances, dependent: :destroy
  accepts_nested_attributes_for :fuel_balances, allow_destroy: true, reject_if: proc { |fuel_balances| fuel_balances[:fuel_tank_id].blank? }
  
  validates_presence_of :unit_id, :issue_date
      
  def month_depot
    "#{depot.name} "+"#{issue_date.strftime("%b")} "+"#{issue_date.year}"
  end 
  
  def self.balance_before(depot_fuel)
    #depot_fuel = DepotFuel.find(depot_fuel_id)
    @begin_last_month = depot_fuel.issue_date.last_month.at_beginning_of_month
    @end_last_month = depot_fuel.issue_date.last_month.at_end_of_month
    @current_unit = depot_fuel.unit_id
    @prevmonth_depot_fuel=DepotFuel.where('unit_id=? AND issue_date >=? AND issue_date <=?', @current_unit, @begin_last_month, @end_last_month)
    @balance_before = []
    depot_fuel.depot.fuel_tanks.group_by(&:fuel_type_id).sort.each do |fuel_type, items|
        @tanks_by_type = depot_fuel.depot.fuel_tanks.where('fuel_type_id=?',fuel_type).pluck(:id)
        if @prevmonth_depot_fuel.count!=0
            @bal_of_tank = @prevmonth_depot_fuel[0].fuel_balances.where('fuel_tank_id IN (?)',@tanks_by_type).sum(&:current) 
            @balance_before << @bal_of_tank if @bal_of_tank!=0
        else
            @balance_before << 0
        end
    end
    return @balance_before
  end
  
  def self.supplied(depot_fuel, fuel_type)
    return depot_fuel.fuel_supplieds.where('fuel_type_id=?',fuel_type).sum(&:quantity).to_i
  end
  
  def self.issued(depot_fuel, fuel_type)
    return depot_fuel.fuel_issueds.where('fuel_type_id=?',fuel_type).sum(&:quantity).to_i	
  end
  
  #tank balance
  def self.balance(depot_fuel, fuel_type) 
    @tanks_by_type = depot_fuel.depot.fuel_tanks.where('fuel_type_id=?',fuel_type).pluck(:id)
    return depot_fuel.fuel_balances.where('fuel_tank_id IN (?)',@tanks_by_type).sum(&:current).to_i
  end
  
end
