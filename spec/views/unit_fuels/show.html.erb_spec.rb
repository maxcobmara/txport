require 'spec_helper'

describe "unit_fuels/show" do
  before(:each) do
    @unit_fuel = assign(:unit_fuel, stub_model(UnitFuel,
      :unit_id => 1,
      :d_vessel => "9.99",
      :d_vehicle => "9.99",
      :d_misctool => "9.99",
      :d_boat => "9.99",
      :p_vehicle => "9.99",
      :p_misctool => "9.99",
      :p_boat => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
  end
end
