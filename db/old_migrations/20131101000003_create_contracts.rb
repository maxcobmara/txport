class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string :contract_no
      t.string :name
      t.text :description
      t.integer :company_id
      t.decimal :value
      t.date :starts_on
      t.date :ends_on
      t.date :issued_by
      t.integer :contract_type

      t.timestamps
    end
    
    create_table :contract_types do |t|
      t.string :short_name
      t.string :description

      t.timestamps
    end
    
    create_table :companies do |t|
      t.string :name
      t.text :address
      t.string :contact_person
      t.string :phone
      t.string :fax
      t.string :email

      t.timestamps
    end
  end
end
