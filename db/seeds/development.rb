require 'faker'

def number_plate
  starts_with = 'ABCDFJKMNPRSTVW'
  first = starts_with.split('').sample
  more  = [*('A'..'Z')].sample(2).join
  number = rand(1...9999)
  first + more + " " + number.to_s
end

rand(10...99).times do
  Position.create!([{
    name: Faker::Job.title + Faker::Job.position
  }])
end

def random_position
  total = Position.count
  total/rand(2..10)
end

random_position.times do
  Rank.create!([{
     shortname: Faker::Job.title,
     name: Faker::Military.navy_rank,
     category: rand(1..4),
     rate: rand(1..2)
  }])
end

random_position.times do
  Expertise.create!([{
     short_name: Faker::Job.field,
     name: Faker::Job.position,
     branch: rand(1..3)
  }])
end

Unit.create!([
  {id: 1, shortname: "company", name: "Company Ltd", code: "01", ancestry: nil, ancestry_depth: 0},
  {id: 2, shortname: Faker::Job.field, name: Faker::Job.field, code: "01", ancestry: "1", ancestry_depth: 1},
  {id: 3, shortname: Faker::Job.field, name: Faker::Job.field, code: "02", ancestry: "1", ancestry_depth: 1},
  {id: 4, shortname: Faker::Job.field, name: Faker::Job.field, code: "03", ancestry: "1", ancestry_depth: 1},
  {id: 5, shortname: Faker::Job.field, name: Faker::Job.field, code: "01", ancestry: "1/4", ancestry_depth: 2}
])

Position.all.each do | position |
  Staff.create!([{
    id_no: Faker::IDNumber.valid,
    rank_id: Rank.all.sample.id,
    name: Faker::Name.name_with_middle,
    unit_id: Unit.all.sample,
    expertise_id: Expertise.all.sample.id,
    position_id: position,
    gender: [1,2].sample,
    religion: [1,2].sample,
    size_data: nil
  }])
end

rand(5..30).times do
 VehicleManufacturer.create!({
   name: Faker::Vehicle.make,
   country: Faker::Address.country
 })
end

rand(3...Staff.count).times.with_index(1) do |m, i|
  Vehicle.create!([{
    reg_no: number_plate,
    chassis_no: Faker::Vehicle.vin,
    engine_no: Faker::Device.serial + i.to_s,
    reg_on: Faker::Date.between(15.years.ago, 1.years.ago),
    manufacturer_year: Faker::Vehicle.year,
    manufacturer_id: VehicleManufacturer.all.sample.id,
    model: Faker::Vehicle.model,
    category_id: 31,
    acquired_on: nil,
    price: "94888.0",
    contract_id: nil,
    status_id: 1,
    acquired_id: Faker::Date.between(15.years.ago, 1.years.ago),
    fuel_type_id: nil,
    fuel_capacity: nil,
    fuel_unit_type_id: nil,
    data: nil
  }])
end

rand(10..200).times do
  start_date = Faker::Date.between(15.years.ago, 1.days.ago)
  m = Maintenance.create!({
    vehicle_id: Vehicle.all.sample.id,
    work_order_no: Faker::Company.spanish_organisation_number,
    contract_id: nil,
    maintenance_date: start_date,
    repaired_by: 1,
    supplied_by: 1,
    repair_date: start_date + rand(5..120).days,
    repair_location: "location",
    created_at: start_date,
    updated_at: start_date
  })
  rand(1..25).times do
    MaintenanceDetail.create!({
      maintenance_id: m.id,
      maintenance_type_id: rand(1..2),
      line_item: Faker::ElectricalComponents.electromechanical,
      line_item_price: Faker::Number.decimal(4),
      quantity: rand(1..10),
      unit_type: UnitType.all.sample.id,
      created_at: start_date,
      updated_at: start_date
    })
  end
end


Vehicle.pluck(:id).each do | v |
  va = VehicleAssignment.create!([{
    unit_id: Unit.all.sample.id,
    document_code: Faker::Invoice.creditor_reference,
    document_date: Faker::Date.between(4.years.ago, 1.days.ago),
    authorised_by: Staff.all.sample.id,
    authorising_unit: Unit.all.sample.id
  })
  start_date = Faker::Date.between(4.years.ago, 1.days.ago)
  VehicleAssignmentDetail.create!({
    vehicle_assignment_id: va.id,
    vehicle_id: v,
    staff_id: Staff.all.sample,
    assigned_on: start_date,
    assignment_end: start_date + rand(1..999).days,
    release_no: nil,
    release_type: nil,
    remark: nil
  })
end

Vehicle.all.each do | v |
  tax = Faker::Number.decimal(3)
  multiplier = rand(1..5)
  start_date = Faker::Date.between(multiplier.years.ago, (multiplier-1).years.ago)
  multiplier.times.with_index do | i |
    VehicleRoadTax.create!({
      vehicle_id: v.id,
      start_on: start_date + i.years,
      end_on: start_date + (i+1).years,
      amount: tax,
      created_at: start_date + i.years,
      updated_at: start_date + i.years
    })
  end
end

puts "Creating Fines"
Vehicle.all.each do | v |
  rand(0..25).times do
    start_date = Faker::Time.between(3.years.ago, Date.today, :all)
    VehicleFine.create!({
      code: Faker::Company.ein,
      vehicle_id: v.id,
      type_id: rand(1..3),
      issued_at: start_date,
      pay_before: start_date.to_date + 90.days,
      location: Faker::Address.street_address,
      reason: Faker::Lorem.sentence(4),
      compound:  rand(10..300).round(-1).to_f,
      created_at: start_date,
      updated_at: start_date
    })
  end
end

puts "Paying Fines"
sample_size = VehicleFine.count/rand(3..5)*rand(1..3)
VehicleFine.all.sample(sample_size).each do | v |
  v.receipt_no  = SecureRandom.hex(12),
  v.paid_on     = (v.issued_at + rand(1..120).days).to_date,
  v.paid_amount = v.compound
  v.save!
end

puts "Creating Toll Cards"
Vehicle.all.each do | v |
  start_date = Faker::Date.between(5.years.ago, 90.days.ago)
  m = VehicleCard.create!({
    vehicle_id: v.id,
    serial_no: SecureRandom.hex(16),
    staff_id: Staff.all.sample.id,
    unit_id: Unit.all.sample.id,
    smart_tag: [true,false].sample,
    smarttag_serial: SecureRandom.hex(12),
    issue_date: start_date + rand(0..90).days,
    start_date: start_date,
    expired_date: start_date + 3.years,
    created_at: start_date,
    updated_at: start_date
  })
end

puts "Ending Life of Some Vehicles"
Vehicle.all.sample(rand(1..5)).each do | v |
  start_date = Faker::Date.between(2.years.ago, 90.days.ago)
  VehicleEndOfLife.create!({
    vehicle_id: v.id,
    status: Faker::Pokemon.move,
    confirmation_code: SecureRandom.hex(6),
    confirmed_on: [nil, start_date].sample,
    data: nil,
    created_at: start_date,
    updated_at: start_date
  })
end

rand(10..50).times do
  company = Faker::Company.name + " " + Faker::Company.suffix
  domain  = company.split(' ').join().downcase + '.' + Faker::Internet.domain_suffix
  contact = Faker::Name.first_name + ' ' + Faker::Name.last_name
  Company.create!({
    name: company,
    address: Faker::Address.street_address + " " + Faker::Address.community,
    contact_person: contact,
    phone: Faker::PhoneNumber.cell_phone,
    fax: Faker::PhoneNumber.cell_phone,
    email: Faker::Internet.username(contact) + '@' + domain
  })
end

rand(1..25).times do
  start_date = Faker::Date.between(2.years.ago, 90.days.ago)
  Contract.create!({
    contract_no: SecureRandom.hex(6),
    name: Faker::Movie.quote,
    description: Faker::Lorem.sentence(12, true, 4),
    company_id: Company.all.sample.id,
    value:  Faker::Number.decimal(6),
    starts_on: start_date,
    ends_on: start_date + rand(1..3).years,
    issued_by: Staff.all.sample.id,
    contract_type: rand(1..3),
    category: rand(1..3),
    created_at: start_date,
    updated_at: start_date
  })
end
