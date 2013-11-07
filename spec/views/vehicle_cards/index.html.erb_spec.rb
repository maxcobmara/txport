require 'spec_helper'

describe "vehicle_cards/index" do
  before(:each) do
    assign(:vehicle_cards, [
      stub_model(VehicleCard,
        :vehicle_id => 1,
        :serial_no => "Serial No"
      ),
      stub_model(VehicleCard,
        :vehicle_id => 1,
        :serial_no => "Serial No"
      )
    ])
  end

  it "renders a list of vehicle_cards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Serial No".to_s, :count => 2
  end
end
