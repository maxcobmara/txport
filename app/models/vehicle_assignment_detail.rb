class VehicleAssignmentDetail < ActiveRecord::Base
  belongs_to :vehicle_assignment, :foreign_key => 'vehicle_assignment_id'
  belongs_to :vehicle, :foreign_key => 'vehicle_id'
  
  validates_uniqueness_of :vehicle_id, :scope => [:assigned_on, :assignment_end]
  
  RELEASETYPE = [
           #  Displayed       stored in db
           ["Perjawatan",1],
           ["Penggatian",2],
		   ["Tambahan",3],
		   ["Pinjaman",4]
]
end