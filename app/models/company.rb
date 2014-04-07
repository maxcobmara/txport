class Company < ActiveRecord::Base
	has_many :repairs,      :class_name => "Maintenance"#,  :foreign_key => "repaired_by"
	has_many :supplies,     :class_name => "Maintenance"#,  :foreign_key => "supplied_by"
  has_many :contractors,  :class_name => "Contracts"#,     :foreign_key => "company_id"
  
  def self.get_supplier(fr_excel,arr_fr_excel)
    suppliers=where('name ILIKE (?)',fr_excel)      
    if suppliers.count > 0
      return suppliers[0].id
    else
      unless arr_fr_excel.include?(fr_excel)
        supplier = where('name ILIKE (?)',fr_excel)[0] || new    
        supplier.name = fr_excel 
        supplier.save!
        return supplier.id
      end
    end
  end
  
end

# == Schema Information
#
# Table name: companies
#
#  address        :text
#  contact_person :string(255)
#  created_at     :datetime
#  email          :string(255)
#  fax            :string(255)
#  id             :integer          not null, primary key
#  name           :string(255)
#  phone          :string(255)
#  updated_at     :datetime
#
