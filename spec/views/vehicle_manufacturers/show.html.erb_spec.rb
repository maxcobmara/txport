require 'spec_helper'

describe "vehicle_manufacturers/show" do
  before(:each) do
    @vehicle_manufacturer = assign(:vehicle_manufacturer, stub_model(VehicleManufacturer,
      :name => "Name",
      :country => "Country"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Country/)
  end
end
