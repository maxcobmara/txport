require 'spec_helper'

describe "fuel_tanks/index" do
  before(:each) do
    assign(:fuel_tanks, [
      stub_model(FuelTank,
        :unit_id => 1,
        :locations => "Locations",
        :capacity => "9.99",
        :unit_type => 2,
        :fuel_type_id => 3
      ),
      stub_model(FuelTank,
        :unit_id => 1,
        :locations => "Locations",
        :capacity => "9.99",
        :unit_type => 2,
        :fuel_type_id => 3
      )
    ])
  end

  it "renders a list of fuel_tanks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Locations".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
