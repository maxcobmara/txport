require 'spec_helper'

describe "vehicle_assignments/edit" do
  before(:each) do
    @vehicle_assignment = assign(:vehicle_assignment, stub_model(VehicleAssignment,
      :vehicle_id => 1,
      :staff_id => 1
    ))
  end

  it "renders the edit vehicle_assignment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vehicle_assignment_path(@vehicle_assignment), "post" do
      assert_select "input#vehicle_assignment_vehicle_id[name=?]", "vehicle_assignment[vehicle_id]"
      assert_select "input#vehicle_assignment_staff_id[name=?]", "vehicle_assignment[staff_id]"
    end
  end
end
