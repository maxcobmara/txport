require 'spec_helper'

describe "AddFuels" do
  describe "GET /add_fuels" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get add_fuels_path
      response.status.should be(200)
    end
  end
end
