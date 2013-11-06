# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

vehicle_statuses = VehicleStatus.create([
  {short_name: 'TB'}, {short_name: 'TBG'}, {short_name: 'TEB'}
])
