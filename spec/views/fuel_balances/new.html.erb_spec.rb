require 'spec_helper'

describe "fuel_balances/new" do
  before(:each) do
    assign(:fuel_balance, stub_model(FuelBalance,
      :depot_fuel_id => 1,
      :fuel_tank_id => 1,
      :current => "9.99"
    ).as_new_record)
  end

  it "renders new fuel_balance form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", fuel_balances_path, "post" do
      assert_select "input#fuel_balance_depot_fuel_id[name=?]", "fuel_balance[depot_fuel_id]"
      assert_select "input#fuel_balance_fuel_tank_id[name=?]", "fuel_balance[fuel_tank_id]"
      assert_select "input#fuel_balance_current[name=?]", "fuel_balance[current]"
    end
  end
end
