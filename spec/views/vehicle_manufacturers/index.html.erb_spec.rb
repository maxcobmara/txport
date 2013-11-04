require 'spec_helper'

describe "vehicle_manufacturers/index" do
  before(:each) do
    assign(:vehicle_manufacturers, [
      stub_model(VehicleManufacturer,
        :name => "Name",
        :country => "Country"
      ),
      stub_model(VehicleManufacturer,
        :name => "Name",
        :country => "Country"
      )
    ])
  end

  it "renders a list of vehicle_manufacturers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
  end
end
