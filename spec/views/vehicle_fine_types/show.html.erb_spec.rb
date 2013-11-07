require 'spec_helper'

describe "vehicle_fine_types/show" do
  before(:each) do
    @vehicle_fine_type = assign(:vehicle_fine_type, stub_model(VehicleFineType,
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
