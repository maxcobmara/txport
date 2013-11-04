require 'spec_helper'

describe "vehicle_categories/show" do
  before(:each) do
    @vehicle_category = assign(:vehicle_category, stub_model(VehicleCategory,
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
