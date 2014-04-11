require 'spec_helper'

describe "vehicle_armies/show" do
  before(:each) do
    @vehicle_army = assign(:vehicle_army, stub_model(VehicleArmy,
      :v_army_no => "V Army No"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/V Army No/)
  end
end
