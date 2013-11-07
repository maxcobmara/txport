require 'spec_helper'

describe "VehicleFines" do
  describe "GET /vehicle_fines" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get vehicle_fines_path
      response.status.should be(200)
    end
  end
end
