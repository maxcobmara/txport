class Vehicle < ActiveRecord::Base
  validates_presence_of :reg_no
  validates_uniqueness_of :reg_no
  validates_uniqueness_of :chassis_no,  :allow_nil => true, :allow_blank => true, :unless => :chassis_is_dash?
  validates_uniqueness_of :engine_no,   :allow_nil => true, :allow_blank => true

  has_many :vehicle_road_taxes, :dependent => :destroy
  has_many :vehicle_fines,      :dependent => :destroy
  has_many :maintenances,       :dependent => :destroy
  has_many :vehicle_assignment_details, :dependent => :destroy #has_many - instead of has_one - refer trello card #87
  belongs_to :contract
  #belongs_to :card,     :class_name => "VehicleCard",     :foreign_key => "vehicle_id"
  has_many :cards, :class_name => "VehicleCard"
  belongs_to :vehiclestatus,    :class_name => "VehicleStatus",       :foreign_key => "status_id"
  belongs_to :vehicleacquired,  :class_name => "AcquiredType",        :foreign_key => "acquired_id"
  belongs_to :manufacturer,     :class_name => "VehicleManufacturer", :foreign_key => "manufacturer_id"
  belongs_to :vehiclecategory,  :class_name => "VehicleCategory",     :foreign_key => "category_id"
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :default_url => "/assets/:style/no-photo.gif"

  # The validation has to go after 'has_attached_file'
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  
  attr_accessor :status, :acquired, :category, :register_on, :parts_jan, :maint_jan, :parts_feb, :maint_feb,:parts_march, :maint_march, :parts_apr, :maint_apr, :parts_may, :maint_may, :parts_june, :maint_june,:parts_july, :maint_july,:parts_aug, :maint_aug,:parts_sept, :maint_sept, :parts_oct, :maint_oct,:parts_nov, :maint_nov,:parts_dec, :maint_dec #for data from excel file
  
  def chassis_is_dash?
    if chassis_no == "-"
      return true
    else
      return false
    end
  end
  
  def self.search(search)
    if search
      where('reg_no ILIKE ?', "%#{search}%")
    else
      Vehicle.all
    end
  end

  
  def self.import(file) 
    spreadsheet = open_spreadsheet(file) 
    
    #BELOW-works successfully for KEMBARAN_A,B,C,D(1)(1)edited.xls
    #header = spreadsheet.row(2) 
    #(3..spreadsheet.last_row).each do |i|
      #row = Hash[[header, spreadsheet.row(i)].transpose] 
      #vehicle = find_by_id(row["reg_no"]) || new 
      #vehicle.attributes = row.to_hash.slice("reg_no","chassis_no","engine_no","price","reg_on") 
      #vehicle.contract_id = 888
      #vehicle.save!
    #end 
    #ABOVE-please do not remove above codes yet - 14feb2014
    
    #BELOW-for TABLE DATA KENDERAAN TLDM.xls
    excel_reg_nos=[]
    vehicles=[]
    excel_year = spreadsheet.cell(3,'A')
    header = spreadsheet.row(5) 
    (6..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose] 
      vehicle = find_by_id(row["reg_no"]) || new 
      vehicle.attributes = row.to_hash.slice("reg_no","category","model","chassis_no","engine_no","price","register_on","status","parts_jan","maint_jan","acquired", "parts_feb", "maint_feb","parts_march", "maint_march", "parts_apr", "maint_apr", "parts_may", "maint_may", "parts_june", "maint_june","parts_july", "maint_july","parts_aug", "maint_aug","parts_sept", "maint_sept", "parts_oct", "maint_oct","parts_nov", "maint_nov","parts_dec", "maint_dec") 
 
      # retrieve fr excel, assign status_id according to drop down
      unless (vehicle.status.nil? || vehicle.status.blank?)
        vehicle.status_id = VehicleStatus.get_status(vehicle.status)         
      end
      # retrieve fr excel, assign acquired_id according to drop down
      unless (vehicle.acquired.nil? || vehicle.acquired.blank?)
        vehicle.acquired_id = AcquiredType.get_acquired(vehicle.acquired)    
      end
      # retrieve fr excel, assign category_id according to drop down
      unless (vehicle.category.nil? || vehicle.category.blank?)
        vehicle.category_id = VehicleCategory.get_category(vehicle.category)    
      end
      # retrieve fr excel, assign manufacturer_id according to drop down
      unless (vehicle.model.nil? || vehicle.model.blank?)
        vehicle.manufacturer_id = VehicleManufacturer.get_manufacturer(vehicle.model)
      end
      
      #to add other date checking - format dd-mm-yyyy vs DB date format
      unless (vehicle.register_on.nil? || vehicle.register_on.blank? || vehicle.register_on==" " || vehicle.register_on=="NIL")
        #if celltype is STRING
        if (vehicle.register_on.is_a? String)
          #DO NOTHING
        #if celltype is DATE  
        elsif vehicle.register_on.is_a? Date
          vehicle.reg_on = vehicle.register_on
        end
      end 
         
      exist_reg_no = excel_reg_nos.include?(vehicle.reg_no)
      unless (vehicle.reg_no.nil? || vehicle.reg_no.blank? || vehicle.reg_no == " " || vehicle.reg_no == "-") 
        if !exist_reg_no
          excel_reg_nos<<vehicle.reg_no
          if vehicle.reg_no.is_a? Numeric
            vehicle.reg_no = vehicle.reg_no.to_i
          end
          
          0.upto(11) do |count|
           vehicle.maintenances.new
          end 
      
          #for 'COMPILED excel file:' -> maintenance_date & repair_date (use default value - last day in every month)
          #although maintenance record not exist for certain month-year, compulsory to add in default maintenance_date & repair_date
          
          #unless (vehicle.maint_jan.nil? || vehicle.maint_jan.blank?)
            vehicle.maintenances[0].value_supplied=vehicle.parts_jan
            vehicle.maintenances[0].value_repaired=vehicle.maint_jan
            vehicle.maintenances[0].maintenance_date=Date.new(excel_year,1,31)
            vehicle.maintenances[0].repair_date=Date.new(excel_year,1,31)
          #end
          #unless (vehicle.maint_feb.nil? || vehicle.maint_feb.blank?)
            vehicle.maintenances[1].value_supplied=vehicle.parts_feb
            vehicle.maintenances[1].value_repaired=vehicle.maint_feb
            vehicle.maintenances[1].maintenance_date=Date.new(excel_year,2,28)
            vehicle.maintenances[1].repair_date=Date.new(excel_year,2,28)
          #end
          #unless (vehicle.maint_march.nil? || vehicle.maint_march.blank?)
            vehicle.maintenances[2].value_supplied=vehicle.parts_march
            vehicle.maintenances[2].value_repaired=vehicle.maint_march
            vehicle.maintenances[2].maintenance_date=Date.new(excel_year,3,31)
            vehicle.maintenances[2].repair_date=Date.new(excel_year,3,31)
          #end
          #unless (vehicle.maint_apr.nil? || vehicle.maint_apr.blank?)
            vehicle.maintenances[3].value_supplied=vehicle.parts_jan
            vehicle.maintenances[3].value_repaired=vehicle.maint_jan
            vehicle.maintenances[3].maintenance_date=Date.new(excel_year,4,30)
            vehicle.maintenances[3].repair_date=Date.new(excel_year,4,30)
          #end
          #unless (vehicle.maint_may.nil? || vehicle.maint_may.blank?)
            vehicle.maintenances[4].value_supplied=vehicle.parts_may
            vehicle.maintenances[4].value_repaired=vehicle.maint_may
            vehicle.maintenances[4].maintenance_date=Date.new(excel_year,5,31)
            vehicle.maintenances[4].repair_date=Date.new(excel_year,5,31)
          #end
          #unless (vehicle.maint_june.nil? || vehicle.maint_june.blank?)
            vehicle.maintenances[5].value_supplied=vehicle.parts_june
            vehicle.maintenances[5].value_repaired=vehicle.maint_june
            vehicle.maintenances[5].maintenance_date=Date.new(excel_year,6,30)
            vehicle.maintenances[5].repair_date=Date.new(excel_year,6,30)
          #end
          #unless (vehicle.maint_july.nil? || vehicle.maint_july.blank?)
            vehicle.maintenances[6].value_supplied=vehicle.parts_july
            vehicle.maintenances[6].value_repaired=vehicle.maint_july
            vehicle.maintenances[6].maintenance_date=Date.new(excel_year,7,31)
            vehicle.maintenances[6].repair_date=Date.new(excel_year,7,31)
          #end
          #unless (vehicle.maint_aug.nil? || vehicle.maint_aug.blank?)
            vehicle.maintenances[7].value_supplied=vehicle.parts_aug
            vehicle.maintenances[7].value_repaired=vehicle.maint_aug
            vehicle.maintenances[7].maintenance_date=Date.new(excel_year,8,31)
            vehicle.maintenances[7].repair_date=Date.new(excel_year,8,31)
          #end
          #unless (vehicle.maint_sept.nil? || vehicle.maint_sept.blank?)
            vehicle.maintenances[8].value_supplied=vehicle.parts_sept
            vehicle.maintenances[8].value_repaired=vehicle.maint_sept
            vehicle.maintenances[8].maintenance_date=Date.new(excel_year,9,30)
            vehicle.maintenances[8].repair_date=Date.new(excel_year,9,30)
          #end
          #unless (vehicle.maint_oct.nil? || vehicle.maint_oct.blank?)
            vehicle.maintenances[9].value_supplied=vehicle.parts_oct
            vehicle.maintenances[9].value_repaired=vehicle.maint_oct
            vehicle.maintenances[9].maintenance_date=Date.new(excel_year,10,31)
            vehicle.maintenances[9].repair_date=Date.new(excel_year,10,31)
          #end
          #unless (vehicle.maint_nov.nil? || vehicle.maint_nov.blank?)
            vehicle.maintenances[10].value_supplied=vehicle.parts_nov
            vehicle.maintenances[10].value_repaired=vehicle.maint_nov
            vehicle.maintenances[10].maintenance_date=Date.new(excel_year,11,30)
            vehicle.maintenances[10].repair_date=Date.new(excel_year,1,30)
          #end
          #unless (vehicle.maint_dec.nil? || vehicle.maint_dec.blank?)
            vehicle.maintenances[11].value_supplied=vehicle.parts_dec
            vehicle.maintenances[11].value_repaired=vehicle.maint_dec
            vehicle.maintenances[11].maintenance_date=Date.new(excel_year,12,31)
            vehicle.maintenances[11].repair_date=Date.new(excel_year,12,31)
          #end
          
          #vehicle.save!    #use this line or line 59(vehicles=[]) & line 94(vehicles<<vehicle) & line 98(return vehicles)
          vehicles<<vehicle #all valid one...will be assign to array & send for data saving
        end
      end      
    end 
    return vehicles
  end


  def self.open_spreadsheet(file) 
    case File.extname(file.original_filename) 
      when ".csv" then Roo::Csv.new(file.path, nil, :ignore) 
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore) 
      when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore) 
      else raise "Unknown file type: #{file.original_filename}" 
    end
  end 
    
  def self.get_invalid(vehicle_list)
    @invalid_vehicles = []
    vehicle_list.each do |vehiclesub|
      unless vehiclesub.valid?
        @invalid_vehicles<<vehiclesub 
      end
	  end
    return @invalid_vehicles 
  end

end
