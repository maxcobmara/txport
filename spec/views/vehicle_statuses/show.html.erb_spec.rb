require 'spec_helper'

describe "vehicle_statuses/show" do
  before(:each) do
    @vehicle_status = assign(:vehicle_status, stub_model(VehicleStatus,
      :short_name => "Short Name",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Short Name/)
    rendered.should match(/Description/)
  end
end
