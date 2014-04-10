require 'spec_helper'

describe "vehicle_nos/show" do
  before(:each) do
    @vehicle_no = assign(:vehicle_no, stub_model(VehicleNo,
      :vehicle_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
