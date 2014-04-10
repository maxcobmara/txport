require 'spec_helper'

describe "vehicle_armies/new" do
  before(:each) do
    assign(:vehicle_army, stub_model(VehicleArmy,
      :v_army_no => "MyString"
    ).as_new_record)
  end

  it "renders new vehicle_army form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vehicle_armies_path, "post" do
      assert_select "input#vehicle_army_v_army_no[name=?]", "vehicle_army[v_army_no]"
    end
  end
end
