require 'spec_helper'

describe "FuelSupplieds" do
  describe "GET /fuel_supplieds" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get fuel_supplieds_path
      response.status.should be(200)
    end
  end
end
