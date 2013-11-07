require 'spec_helper'

describe "vehicle_road_taxes/index" do
  before(:each) do
    assign(:vehicle_road_taxes, [
      stub_model(VehicleRoadTax,
        :vehicle_id => 1,
        :amount => "9.99"
      ),
      stub_model(VehicleRoadTax,
        :vehicle_id => 1,
        :amount => "9.99"
      )
    ])
  end

  it "renders a list of vehicle_road_taxes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
