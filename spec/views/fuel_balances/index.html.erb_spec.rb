require 'spec_helper'

describe "fuel_balances/index" do
  before(:each) do
    assign(:fuel_balances, [
      stub_model(FuelBalance,
        :depot_fuel_id => 1,
        :fuel_tank_id => 2,
        :current => "9.99"
      ),
      stub_model(FuelBalance,
        :depot_fuel_id => 1,
        :fuel_tank_id => 2,
        :current => "9.99"
      )
    ])
  end

  it "renders a list of fuel_balances" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
