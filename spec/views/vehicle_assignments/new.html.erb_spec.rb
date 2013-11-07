require 'spec_helper'

describe "vehicle_assignments/new" do
  before(:each) do
    assign(:vehicle_assignment, stub_model(VehicleAssignment,
      :vehicle_id => 1,
      :staff_id => 1
    ).as_new_record)
  end

  it "renders new vehicle_assignment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vehicle_assignments_path, "post" do
      assert_select "input#vehicle_assignment_vehicle_id[name=?]", "vehicle_assignment[vehicle_id]"
      assert_select "input#vehicle_assignment_staff_id[name=?]", "vehicle_assignment[staff_id]"
    end
  end
end
