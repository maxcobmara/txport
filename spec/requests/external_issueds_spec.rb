require 'spec_helper'

describe "ExternalIssueds" do
  describe "GET /external_issueds" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get external_issueds_path
      response.status.should be(200)
    end
  end
end
