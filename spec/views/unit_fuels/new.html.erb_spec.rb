require 'spec_helper'

describe "unit_fuels/new" do
  before(:each) do
    assign(:unit_fuel, stub_model(UnitFuel,
      :unit_id => 1,
      :d_vessel => "9.99",
      :d_vehicle => "9.99",
      :d_misctool => "9.99",
      :d_boat => "9.99",
      :p_vehicle => "9.99",
      :p_misctool => "9.99",
      :p_boat => "9.99"
    ).as_new_record)
  end

  it "renders new unit_fuel form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", unit_fuels_path, "post" do
      assert_select "input#unit_fuel_unit_id[name=?]", "unit_fuel[unit_id]"
      assert_select "input#unit_fuel_d_vessel[name=?]", "unit_fuel[d_vessel]"
      assert_select "input#unit_fuel_d_vehicle[name=?]", "unit_fuel[d_vehicle]"
      assert_select "input#unit_fuel_d_misctool[name=?]", "unit_fuel[d_misctool]"
      assert_select "input#unit_fuel_d_boat[name=?]", "unit_fuel[d_boat]"
      assert_select "input#unit_fuel_p_vehicle[name=?]", "unit_fuel[p_vehicle]"
      assert_select "input#unit_fuel_p_misctool[name=?]", "unit_fuel[p_misctool]"
      assert_select "input#unit_fuel_p_boat[name=?]", "unit_fuel[p_boat]"
    end
  end
end
