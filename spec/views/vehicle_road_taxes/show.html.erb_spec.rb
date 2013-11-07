require 'spec_helper'

describe "vehicle_road_taxes/show" do
  before(:each) do
    @vehicle_road_tax = assign(:vehicle_road_tax, stub_model(VehicleRoadTax,
      :vehicle_id => 1,
      :amount => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/9.99/)
  end
end
