require 'spec_helper'

describe "vehicle_nos/new" do
  before(:each) do
    assign(:vehicle_no, stub_model(VehicleNo,
      :vehicle_id => 1
    ).as_new_record)
  end

  it "renders new vehicle_no form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vehicle_nos_path, "post" do
      assert_select "input#vehicle_no_vehicle_id[name=?]", "vehicle_no[vehicle_id]"
    end
  end
end
