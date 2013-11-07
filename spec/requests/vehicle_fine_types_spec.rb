require 'spec_helper'

describe "VehicleFineTypes" do
  describe "GET /vehicle_fine_types" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get vehicle_fine_types_path
      response.status.should be(200)
    end
  end
end
