class Maintenance < ActiveRecord::Base
	belongs_to :vehicle
  belongs_to :contract
	belongs_to :repairer, :class_name => "Company", :foreign_key => "repaired_by"
	belongs_to :part_supplier, :class_name => "Company", :foreign_key => "supplied_by"
  has_many :maintenance_details, dependent: :destroy
  accepts_nested_attributes_for :maintenance_details, allow_destroy: true, reject_if: proc { |maintenance_details| maintenance_details[:quantity].blank? }

  attr_accessor :parts, :line_item_price, :maintenance_type, :repair_date_ex, :repair_location_ex, :supplier, :value_repaired_ex

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
     csv << column_names
     all.each do |maintenance|
       csv << maintenance.attributes.values_at(*column_names)
    end
  end
  end

  def self.import(file) 
    spreadsheet = open_spreadsheet(file) 
    spreadsheet.default_sheet = spreadsheet.sheets.second 
    
    excel_month = spreadsheet.cell(5,'B')
    excel_year = spreadsheet.cell(6,'B')
	
	vehicles_exist=Vehicle.all.map(&:reg_no)
	vehicles_excel=[]
	(11..spreadsheet.last_row).each do |i|
		vehicles_excel<<spreadsheet.cell(i,'B')
	end
	exist_vehicle = vehicles_excel.all? { |e| vehicles_exist.include?(e) }
	
  if exist_vehicle==true	
    unless (excel_month.nil? || excel_month.blank? || excel_month == " " || excel_month == "-") && (excel_year.nil? || excel_year.blank? || excel_year == " " || excel_year == "-") 
  
      begin_month = Date.new(excel_year.to_i,excel_month.to_i,1)
      next_month = begin_month+1.month
      end_day = 31 if (excel_month == 1)||(excel_month == 3)||(excel_month == 5)||(excel_month == 7)||(excel_month == 8)||(excel_month == 10)||(excel_month == 12)
      end_day = 28 if (excel_month == 2)
      end_day = 30 if (excel_month == 4)||(excel_month == 6)||(excel_month == 8)||(excel_month == 11)
      header = spreadsheet.row(8) 
      vehicle_reg_arr=[]
          
      (11..spreadsheet.last_row).each do |i|
        vehicle_reg_no = spreadsheet.cell(i,'B')
        vehicle_reg_arr<<vehicle_reg_no
        row = Hash[[header, spreadsheet.row(i)].transpose] 
        maints_types=[]
        comp_suppliers=[]
        unit_types=[]
        unless (vehicle_reg_no.nil? || vehicle_reg_no.blank? || vehicle_reg_no == " " || vehicle_reg_no == "-") 
            if (Vehicle.all.map(&:reg_no).include?(vehicle_reg_no)==true) 
                vehicle_id = Vehicle.find_by_reg_no(vehicle_reg_no).id
                m = where('vehicle_id=? AND maintenance_date >=? AND maintenance_date <?', vehicle_id, begin_month, next_month)[0] || new
                m.vehicle_id = vehicle_id
                m.attributes = row.to_hash.slice("maintenance_date","repair_date_ex","value_repaired_ex","repair_location_ex","parts","line_item_price","maintenance_type","supplier")
                if (m.maintenance_date.nil? || m.maintenance_date.blank? || m.maintenance_date==" "|| m.maintenance_date=="-")
                  m.maintenance_date = Date.new(excel_year.to_i,excel_month.to_i,end_day)
                end

                #for new maintenance only - repair_date - at least 1 line must exist
                unless (m.repair_date_ex.nil? || m.repair_date_ex.blank? || m.repair_date_ex==" "|| m.repair_date_ex=="-")
                  if m.id.nil? || m.id.blank?
                    m.repair_date = m.repair_date_ex                   
                  end
                end 
                 
                #for new maintenance only
                unless (m.repair_location_ex.nil? || m.repair_location_ex.blank? || m.repair_location_ex==" "|| m.repair_location_ex=="-")
                  if m.id.nil? || m.id.blank?
                    m.repair_location = m.repair_location_ex                   
                  end 
                end
              
                #for new maintenance only
                unless (m.value_repaired_ex.nil? || m.value_repaired_ex.blank? || m.value_repaired_ex==" "|| m.value_repaired_ex=="-")
                  if m.id.nil? || m.id.blank?
                    m.value_repaired = m.value_repaired_ex               
                  end 
                end
              
                #for new maintenance only
                unless (m.supplier.nil? || m.supplier.blank? || m.supplier==" "||m.supplier=="-")
                  if m.id.nil? || m.id.blank?
                    m.supplied_by = Company.get_supplier(m.supplier, comp_suppliers)
                    comp_suppliers<<m.supplier if Company.all.pluck(:name).include?(m.supplier)
                  end
                end  
              
                #repeating fields - maintenance details
                unless (m.parts.nil? || m.parts.blank? || m.parts == " " || m.parts == "-")    
                  if m.id.nil? || m.id.blank?
                    ind = 0
                    exist_parts = false
                  else
                    ind = m.maintenance_details.count
                    line_items = m.maintenance_details.map(&:line_item)
                    exist_parts = line_items.include?(m.parts)
                  end
                  if exist_parts == false 
                    m.maintenance_details.new
                    m.maintenance_details[ind].line_item = m.parts 
                    m.maintenance_details[ind].line_item_price = m.line_item_price 
                    m.maintenance_details[ind].quantity = MaintenanceDetail.get_quantity(m.parts)
                    m.maintenance_details[ind].unit_type = UnitType.get_type(m.parts, unit_types)
                    unit_type_fr_excel = UnitType.get_type_desc(m.parts)
                    unit_types<<unit_type_fr_excel if UnitType.all.pluck(:short_name).include?(unit_type_fr_excel)
                    unless (m.maintenance_type.nil? || m.maintenance_type.blank?)
                      m.maintenance_details[ind].maintenance_type_id = MaintenanceType.get_type(m.maintenance_type,maints_types)
                      maints_types<<m.maintenance_type if MaintenanceType.all.pluck(:type_name).include?(m.maintenance_type)
                    end
                  end
                end
                
            end   #end for if (Vehicle.all.map(&:reg_no)...
        end   #end for unless (vehicle_reg_no.nil?)....
        m.save! 
      end   #end for 11..spreadsheet
    
      #Update value_supplied in Maintenance table, if parts (alat ganti) exist
      uniq_vehicle_regs = vehicle_reg_arr.uniq
      for vehicle_reg in uniq_vehicle_regs 
        v_id=Vehicle.find_by_reg_no(vehicle_reg)
        m2=Maintenance.find_by_vehicle_id(v_id)
        m2.value_supplied = MaintenanceDetail.where('maintenance_id=?',m2.id).sum(:line_item_price)
        m2.save!
      end

    else #if month & year cell in excel table is blank!... 
      return "invalid_month_and_year"
    end #end for unless (excel_month.nil?...
   else
      return "vehicle record not exist"
   end # end for if exist_vehicles==true (exist in Vehicle records)
  end
  
  def self.open_spreadsheet(file) 
    case File.extname(file.original_filename) 
      when ".csv" then Roo::Csv.new(file.path, nil, :ignore) 
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore) 
      when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore) 
      else raise "Unknown file type: #{file.original_filename}" 
    end
  end
  
end

