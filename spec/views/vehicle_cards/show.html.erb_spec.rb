require 'spec_helper'

describe "vehicle_cards/show" do
  before(:each) do
    @vehicle_card = assign(:vehicle_card, stub_model(VehicleCard,
      :vehicle_id => 1,
      :serial_no => "Serial No"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Serial No/)
  end
end
