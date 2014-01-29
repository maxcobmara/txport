require 'spec_helper'

describe "depot_fuels/edit" do
  before(:each) do
    @depot_fuel = assign(:depot_fuel, stub_model(DepotFuel,
      :unit_id => 1
    ))
  end

  it "renders the edit depot_fuel form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", depot_fuel_path(@depot_fuel), "post" do
      assert_select "input#depot_fuel_unit_id[name=?]", "depot_fuel[unit_id]"
    end
  end
end
