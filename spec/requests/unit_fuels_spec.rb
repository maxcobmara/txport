require 'spec_helper'

describe "UnitFuels" do
  describe "GET /unit_fuels" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get unit_fuels_path
      response.status.should be(200)
    end
  end
end
