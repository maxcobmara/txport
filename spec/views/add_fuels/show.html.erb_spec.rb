require 'spec_helper'

describe "add_fuels/show" do
  before(:each) do
    @add_fuel = assign(:add_fuel, stub_model(AddFuel,
      :unit_fuel_id => 1,
      :fuel_type_id => 2,
      :description => "Description",
      :quantity => "9.99",
      :unit_type_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Description/)
    rendered.should match(/9.99/)
    rendered.should match(/3/)
  end
end
