require 'spec_helper'

describe "vehicle_statuses/index" do
  before(:each) do
    assign(:vehicle_statuses, [
      stub_model(VehicleStatus,
        :short_name => "Short Name",
        :description => "Description"
      ),
      stub_model(VehicleStatus,
        :short_name => "Short Name",
        :description => "Description"
      )
    ])
  end

  it "renders a list of vehicle_statuses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Short Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
