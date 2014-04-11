require 'spec_helper'

describe "vehicle_armies/edit" do
  before(:each) do
    @vehicle_army = assign(:vehicle_army, stub_model(VehicleArmy,
      :v_army_no => "MyString"
    ))
  end

  it "renders the edit vehicle_army form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vehicle_army_path(@vehicle_army), "post" do
      assert_select "input#vehicle_army_v_army_no[name=?]", "vehicle_army[v_army_no]"
    end
  end
end
