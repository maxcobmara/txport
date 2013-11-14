require 'spec_helper'

describe "fuel_tanks/show" do
  before(:each) do
    @fuel_tank = assign(:fuel_tank, stub_model(FuelTank,
      :unit_id => 1,
      :locations => "Locations",
      :capacity => "9.99",
      :unit_type => 2,
      :fuel_type_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Locations/)
    rendered.should match(/9.99/)
    rendered.should match(/2/)
    rendered.should match(/3/)
  end
end
