require 'spec_helper'

describe "depot_fuels/index" do
  before(:each) do
    assign(:depot_fuels, [
      stub_model(DepotFuel,
        :unit_id => 1
      ),
      stub_model(DepotFuel,
        :unit_id => 1
      )
    ])
  end

  it "renders a list of depot_fuels" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
