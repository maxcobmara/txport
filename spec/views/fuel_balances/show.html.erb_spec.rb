require 'spec_helper'

describe "fuel_balances/show" do
  before(:each) do
    @fuel_balance = assign(:fuel_balance, stub_model(FuelBalance,
      :depot_fuel_id => 1,
      :fuel_tank_id => 2,
      :current => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/9.99/)
  end
end
