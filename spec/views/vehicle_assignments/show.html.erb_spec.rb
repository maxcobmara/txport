require 'spec_helper'

describe "vehicle_assignments/show" do
  before(:each) do
    @vehicle_assignment = assign(:vehicle_assignment, stub_model(VehicleAssignment,
      :vehicle_id => 1,
      :staff_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
