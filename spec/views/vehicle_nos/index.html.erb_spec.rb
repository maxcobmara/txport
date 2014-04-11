require 'spec_helper'

describe "vehicle_nos/index" do
  before(:each) do
    assign(:vehicle_nos, [
      stub_model(VehicleNo,
        :vehicle_id => 1
      ),
      stub_model(VehicleNo,
        :vehicle_id => 1
      )
    ])
  end

  it "renders a list of vehicle_nos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
