require 'spec_helper'

describe "vehicle_assignments/index" do
  before(:each) do
    assign(:vehicle_assignments, [
      stub_model(VehicleAssignment,
        :vehicle_id => 1,
        :staff_id => 2
      ),
      stub_model(VehicleAssignment,
        :vehicle_id => 1,
        :staff_id => 2
      )
    ])
  end

  it "renders a list of vehicle_assignments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
