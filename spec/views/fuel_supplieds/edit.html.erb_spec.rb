require 'spec_helper'

describe "fuel_supplieds/edit" do
  before(:each) do
    @fuel_supplied = assign(:fuel_supplied, stub_model(FuelSupplied,
      :depot_fuel_id => 1,
      :fuel_type_id => 1,
      :quantity => "9.99",
      :unit_type_id => 1
    ))
  end

  it "renders the edit fuel_supplied form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", fuel_supplied_path(@fuel_supplied), "post" do
      assert_select "input#fuel_supplied_depot_fuel_id[name=?]", "fuel_supplied[depot_fuel_id]"
      assert_select "input#fuel_supplied_fuel_type_id[name=?]", "fuel_supplied[fuel_type_id]"
      assert_select "input#fuel_supplied_quantity[name=?]", "fuel_supplied[quantity]"
      assert_select "input#fuel_supplied_unit_type_id[name=?]", "fuel_supplied[unit_type_id]"
    end
  end
end
