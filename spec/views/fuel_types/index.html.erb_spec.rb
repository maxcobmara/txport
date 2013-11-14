require 'spec_helper'

describe "fuel_types/index" do
  before(:each) do
    assign(:fuel_types, [
      stub_model(FuelType,
        :shortname => "Shortname",
        :name => "Name"
      ),
      stub_model(FuelType,
        :shortname => "Shortname",
        :name => "Name"
      )
    ])
  end

  it "renders a list of fuel_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Shortname".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
