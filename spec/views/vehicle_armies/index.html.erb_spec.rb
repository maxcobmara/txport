require 'spec_helper'

describe "vehicle_armies/index" do
  before(:each) do
    assign(:vehicle_armies, [
      stub_model(VehicleArmy,
        :v_army_no => "V Army No"
      ),
      stub_model(VehicleArmy,
        :v_army_no => "V Army No"
      )
    ])
  end

  it "renders a list of vehicle_armies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "V Army No".to_s, :count => 2
  end
end
