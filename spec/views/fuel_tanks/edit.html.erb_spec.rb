require 'spec_helper'

describe "fuel_tanks/edit" do
  before(:each) do
    @fuel_tank = assign(:fuel_tank, stub_model(FuelTank,
      :unit_id => 1,
      :locations => "MyString",
      :capacity => "9.99",
      :unit_type => 1,
      :fuel_type_id => 1
    ))
  end

  it "renders the edit fuel_tank form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", fuel_tank_path(@fuel_tank), "post" do
      assert_select "input#fuel_tank_unit_id[name=?]", "fuel_tank[unit_id]"
      assert_select "input#fuel_tank_locations[name=?]", "fuel_tank[locations]"
      assert_select "input#fuel_tank_capacity[name=?]", "fuel_tank[capacity]"
      assert_select "input#fuel_tank_unit_type[name=?]", "fuel_tank[unit_type]"
      assert_select "input#fuel_tank_fuel_type_id[name=?]", "fuel_tank[fuel_type_id]"
    end
  end
end
