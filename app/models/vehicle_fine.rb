class VehicleFine < ActiveRecord::Base
 
 belongs_to :vehicle, :foreign_key => "vehicle_id"
 belongs_to :vehicle_fine_type, :foreign_key => "type_id"
 
 validates_presence_of :vehicle_id, :code, :type_id, :issued_at, :compound
 
 attr_accessor :reg_no, :summon_date, :summon_time, :summon_code, :summon_location, :summon_desc, :compound_amount, :discounted_amount 
 
 def table_status
   if pay_before == nil
     ""
   elsif paid_on != nil
     "info" #paid
   elsif pay_before < Date.today
     "error" #overdue
   elsif pay_before < Date.today + 1.months
     "warning" #due
   else
     "success" #ok
   end
 end
 
 def payment_status
   if paid_amount == nil
     "Tiada Bayaran"
   elsif paid_amount < compound && paid_amount > 0 &&receipt_no.length > 1
     "Diskaun"
   elsif paid_amount == compound && receipt_no.length > 1
     "Bayaran Penuh"
   elsif paid_amount = 0 && receipt_no.length > 1
     "Dikecualikan"     
   end
 end
 
 def self.to_csv(options = {})
   CSV.generate(options) do |csv|
    csv << column_names
    all.each do |vehicle_fine|
      csv << vehicle_fine.attributes.values_at(*column_names)
   end
 end
 end
 
 def self.import(file)
	spreadsheet = open_spreadsheet(file) 
	#first sheet---
    spreadsheet.default_sheet = spreadsheet.sheets.first
	header = spreadsheet.row(6) 
	vehicles_fr_excel=[]
	(8..spreadsheet.last_row).each do |i|
		e = spreadsheet.cell(i,'B')
		unless (e.nil? || e.blank? || e==" " || e=="-")
			vehicles_fr_excel << (e.scan(/\D+/)+e.scan(/\d+/)).join(" ")
		end
	end
	#second sheet---
	second_sheet = spreadsheet.sheets.second							
	last_row_second = spreadsheet.last_row(second_sheet)
	header2 = spreadsheet.row(9,second_sheet) 
	vehicles_fr_excel2=[]
	(10..last_row_second).each do |i|
		e2 = spreadsheet.cell(i,'B',second_sheet)
		unless (e2.nil? || e2.blank? || e2==" " || e2=="-")
			vehicles_fr_excel2 << (e2.scan(/\D+/)+e2.scan(/\d+/)).join(" ")
		end
	end
	#check for existance---
	vehicles_excel = vehicles_fr_excel.uniq
	vehicles_excel2 = vehicles_fr_excel2.uniq
	vehicles_exist = Vehicle.all.pluck(:reg_no)
	exist_vehicle = vehicles_excel.all? { |e| vehicles_exist.include?(e) }
	exist_vehicle2 = vehicles_excel2.all? { |e| vehicles_exist.include?(e) }
	summon_issuer = spreadsheet.cell(3,'B')
	unless (summon_issuer.nil? || summon_issuer.blank? || summon_issuer==" " || summon_issuer=="-")
		issuer_exist=true
	else
		issuer_exist=false
	end
	
	if exist_vehicle==true && exist_vehicle2==true && issuer_exist==true	
		#sheet 1 section ---
		(8..spreadsheet.last_row).each do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose] 
			reg_no = spreadsheet.cell(i,'B')
			summoncode = spreadsheet.cell(i,'D')
			unless (reg_no.nil? || reg_no.blank? || reg_no==" " || reg_no=="-")
				reg_no_rev = (reg_no.scan(/\D+/)+reg_no.scan(/\d+/)).join(" ") 	#WHM2323 becomes WHM 2323
				vehicle_id = Vehicle.get_vehicle(reg_no_rev) 					#("WHM 498") #46
				vf = where('vehicle_id =? AND code=?', vehicle_id, summoncode)[0] || new
				vf.attributes = row.to_hash.slice("reg_no","summon_code","summon_date","summon_time","summon_location","summon_desc","compound_amount","discounted_amount")
				vf.vehicle_id = vehicle_id
				vf.code = vf.summon_code
				unless (vf.summon_date.is_a? Date) && (vf.summon_time.nil? || vf.summon_time.blank?)
					justdate = vf.summon_date.to_date
					time_only = vf.summon_time.scan(/\d{2}/)
					year_only = justdate.year
					month_only = justdate.month
					day_only = justdate.day
					vf.issued_at = Time.new(year_only,month_only,day_only,time_only[0],time_only[1])
				end
				vf.location = vf.summon_location
				vf.compound = vf.compound_amount
				unless (vf.summon_desc.nil? || vf.summon_desc.blank? || vf.summon_desc==" " || vf.summon_desc=="-")
					vf.reason = vf.summon_desc
					vf.type_id = VehicleFineType.get_type(summon_issuer)
				end
			end
			
			vf.save!
		end
		#sheet 2 section ---
		(10..last_row_second).each do |i|
			row2 = Hash[[header2, spreadsheet.row(i,second_sheet)].transpose]
			reg_no = spreadsheet.cell(i,'B',second_sheet)						#row2["reg_no"]					
			summoncode = spreadsheet.cell(i,'D',second_sheet)					#row2["summon_code"]		
			compound_amt = spreadsheet.cell(i,'M',second_sheet)					#row2["compound_amount"]	
			unless (reg_no.nil? || reg_no.blank? || reg_no==" " || reg_no=="-")
				reg_no_rev = (reg_no.scan(/\D+/)+reg_no.scan(/\d+/)).join(" ") 	#WHM2323 becomes WHM 2323
				vehicle_id = Vehicle.get_vehicle(reg_no_rev) 					
				vf2 = where('vehicle_id =? AND code=?', vehicle_id, summoncode)[0] 
				vf2.attributes = row2.to_hash.slice("discounted_amount")
				vf2.paid_amount = vf2.discounted_amount
				vf2.save!
			end
		end
	else
		if exist_vehicle==false || exist_vehicle2==false
			return "vehicle not exist"
		else
			return "issuer is required"
		end
	end
	
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

# == Schema Information
#
# Table name: vehicle_fines
#
#  code        :string(255)
#  compound    :decimal(, )
#  created_at  :datetime
#  id          :integer          not null, primary key
#  issued_at   :datetime
#  location    :string(255)
#  paid_amount :decimal(, )
#  paid_on     :date
#  pay_before  :date
#  reason      :string(255)
#  receipt_no  :string(255)
#  type_id     :integer
#  updated_at  :datetime
#  vehicle_id  :integer
#
