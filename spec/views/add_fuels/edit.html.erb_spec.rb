require 'spec_helper'

describe "add_fuels/edit" do
  before(:each) do
    @add_fuel = assign(:add_fuel, stub_model(AddFuel,
      :unit_fuel_id => 1,
      :fuel_type_id => 1,
      :description => "MyString",
      :quantity => "9.99",
      :unit_type_id => 1
    ))
  end

  it "renders the edit add_fuel form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", add_fuel_path(@add_fuel), "post" do
      assert_select "input#add_fuel_unit_fuel_id[name=?]", "add_fuel[unit_fuel_id]"
      assert_select "input#add_fuel_fuel_type_id[name=?]", "add_fuel[fuel_type_id]"
      assert_select "input#add_fuel_description[name=?]", "add_fuel[description]"
      assert_select "input#add_fuel_quantity[name=?]", "add_fuel[quantity]"
      assert_select "input#add_fuel_unit_type_id[name=?]", "add_fuel[unit_type_id]"
    end
  end
end
