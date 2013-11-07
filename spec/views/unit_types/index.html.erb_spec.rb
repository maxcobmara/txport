require 'spec_helper'

describe "unit_types/index" do
  before(:each) do
    assign(:unit_types, [
      stub_model(UnitType,
        :short_name => "Short Name",
        :description => "Description"
      ),
      stub_model(UnitType,
        :short_name => "Short Name",
        :description => "Description"
      )
    ])
  end

  it "renders a list of unit_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Short Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
