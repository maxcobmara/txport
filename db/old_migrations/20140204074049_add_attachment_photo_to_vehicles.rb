class AddAttachmentPhotoToVehicles < ActiveRecord::Migration
  def self.up
    change_table :vehicles do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :vehicles, :photo
  end
end
