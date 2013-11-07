json.array!(@companies) do |company|
  json.extract! company, :name, :address, :contact_person, :phone, :fax, :email
  json.url company_url(company, format: :json)
end
