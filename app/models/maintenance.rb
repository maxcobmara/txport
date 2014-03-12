class Maintenance < ActiveRecord::Base
	belongs_to :vehicle
  belongs_to :contract
	belongs_to :repairer, :class_name => "Company", :foreign_key => "repaired_by"
	belongs_to :supplier, :class_name => "Company", :foreign_key => "supplied_by"
  has_many :maintenance_details, dependent: :destroy
  accepts_nested_attributes_for :maintenance_details, allow_destroy: true, reject_if: proc { |maintenance_details| maintenance_details[:quantity].blank? }

  attr_accessor :maint_jan_date, :maint_feb_date

  def self.import(file) 
    spreadsheet = open_spreadsheet(file) 
    
    excel_reg_nos=[]
    vehicles=[]
    excel_year = spreadsheet.cell(3,'A')
    header = spreadsheet.row(4) 
    (5..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose] 
      
      vehicle_reg_no = spreadsheet.cell(i,'D')
      unless (vehicle_reg_no.nil? || vehicle_reg_no.blank? || vehicle_reg_no == " " || vehicle_reg_no == "-") 
        if Vehicle.all.map(&:reg_no).include?(vehicle_reg_no)==true
          vehicle_id = Vehicle.find_by_reg_no(vehicle_reg_no).id
          #maintenance = Maintenance.new
          #maintenance.attributes = row.to_hash.slice("maint_jan_date","maint_feb_date")
          
          #--maintenance for January
          begin_month = Date.new(excel_year,1,1)
          next_month = begin_month+1.month
          
          0.upto(1) do |count|
            maintenance_id = where('vehicle_id=? AND maintenance_date >=? AND maintenance_date <?', vehicle_id, begin_month, next_month)[0].id
            maintenance = find(maintenance_id)
            maintenance.attributes = row.to_hash.slice("maint_jan_date","maint_feb_date")
            #maintenance.maintenance_date = Date.new(excel_year.to_i,1,23)               #maint_jan_date 
            if count==0
              maintenance.maintenance_date = maintenance.maint_jan_date
            end
            maintenance.save!
            begin_month = next_month          #begin_month+=1.month
            next_month = begin_month+1.month
          end
          
          #maintenance_id = where('vehicle_id=? AND maintenance_date >=? AND maintenance_date <?', vehicle_id, begin_month, next_month)[0].id     
          #maintenance_jan = find(maintenance_id)                                        #find(37856)
          #maintenance_jan.attributes = row.to_hash.slice("maint_jan_date")             #assign attr_accessor value first (for jan only)
          #maintenance_jan.maintenance_date = Date.new(excel_year.to_i,1,23)             #maintenance.maint_jan_date
          #maintenance_jan.save!
          
          #--maintenance for February
          #begin_month+= begin_month+1.month
          #next_month = begin_month+1.month
          #maintenance_id = where('vehicle_id=? AND maintenance_date >=? AND maintenance_date <?', vehicle_id, begin_month, next_month)[0].id     
          #maintenance_feb = find(maintenance_id)                                        #find(37856)
          #maintenance_feb.attributes = row.to_hash.slice("maint_feb_date")              #assign attr_accessor value first (for jan only)
          #maintenance_feb.maintenance_date = Date.new(excel_year.to_i,2,23)             #maintenance.maint_jan_date
          #maintenance_feb.save!
        end
      end
      
     
      #vehicle = find_by_id(row["reg_no"]) || new 
      #vehicle.attributes = row.to_hash.slice("reg_no","category","model","chassis_no","engine_no","price","register_on","status","parts_jan","maint_jan","acquired", "parts_feb", "maint_feb","parts_march", "maint_march", "parts_apr", "maint_apr", "parts_may", "maint_may", "parts_june", "maint_june","parts_july", "maint_july","parts_aug", "maint_aug","parts_sept", "maint_sept", "parts_oct", "maint_oct","parts_nov", "maint_nov","parts_dec", "maint_dec") 
 
      # retrieve fr excel, assign status_id according to drop down
      #unless (vehicle.status.nil? || vehicle.status.blank?)
        #vehicle.status_id = VehicleStatus.get_status(vehicle.status)         
        #end
      
         
      #exist_reg_no = excel_reg_nos.include?(vehicle.reg_no)
      #unless (vehicle.reg_no.nil? || vehicle.reg_no.blank? || vehicle.reg_no == " " || vehicle.reg_no == "-") 
        #if !exist_reg_no
          #excel_reg_nos<<vehicle.reg_no
          #if vehicle.reg_no.is_a? Numeric
            #vehicle.reg_no = vehicle.reg_no.to_i
            #end
          #vehicles<<vehicle #all valid one...will be assign to array & send for data saving
          #end
      #end      
    end 
    #return vehicles
  end


  def self.open_spreadsheet(file) 
    case File.extname(file.original_filename) 
      when ".csv" then Roo::Csv.new(file.path, nil, :ignore) 
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore) 
      when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore) 
      else raise "Unknown file type: #{file.original_filename}" 
    end
  end 
    
  def self.get_invalid(maintenance_list)
    @invalid_maintenances = []
    maintenance_list.each do |maintenancesub|
      unless maintenancesub.valid?
        @invalid_maintenances<<maintenancesub 
      end
	  end
    return @invalid_maintenances 
  end

end

