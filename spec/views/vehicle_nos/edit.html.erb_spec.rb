require 'spec_helper'

describe "vehicle_nos/edit" do
  before(:each) do
    @vehicle_no = assign(:vehicle_no, stub_model(VehicleNo,
      :vehicle_id => 1
    ))
  end

  it "renders the edit vehicle_no form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vehicle_no_path(@vehicle_no), "post" do
      assert_select "input#vehicle_no_vehicle_id[name=?]", "vehicle_no[vehicle_id]"
    end
  end
end
