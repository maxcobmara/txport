require 'spec_helper'

describe "fuel_supplieds/show" do
  before(:each) do
    @fuel_supplied = assign(:fuel_supplied, stub_model(FuelSupplied,
      :depot_fuel_id => 1,
      :fuel_type_id => 2,
      :quantity => "9.99",
      :unit_type_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/9.99/)
    rendered.should match(/3/)
  end
end
