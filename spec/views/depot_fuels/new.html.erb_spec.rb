require 'spec_helper'

describe "depot_fuels/new" do
  before(:each) do
    assign(:depot_fuel, stub_model(DepotFuel,
      :unit_id => 1
    ).as_new_record)
  end

  it "renders new depot_fuel form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", depot_fuels_path, "post" do
      assert_select "input#depot_fuel_unit_id[name=?]", "depot_fuel[unit_id]"
    end
  end
end
