# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create!([
  {email: "maxcobmara@gmail.com", password: "maximum8", password_confirmation: "maximum8", roles: {:user_roles=>{"administration"=>"1", "guest"=>"1", "data_entry"=>"1"}}}
])

UnitType.create!([
  {short_name: "LTR", description: "LITRE"},
  {short_name: "TNE", description: "TONNE"},
  {short_name: "UNT", description: "UNIT"},
  {short_name: "PCS", description: "PIECES"},
  {short_name: "KG", description: "KILOGRAM"},
  {short_name: "NOS", description: "Numbers"},
  {short_name: "PRS", description: "PAIRS"}
])











VehicleStatus.create([
  {short_name: 'TB'}, {short_name: 'TBG'}, {short_name: 'TEB'}
])
