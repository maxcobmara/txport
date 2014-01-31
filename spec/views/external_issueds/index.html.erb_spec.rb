require 'spec_helper'

describe "external_issueds/index" do
  before(:each) do
    assign(:external_issueds, [
      stub_model(ExternalIssued,
        :unit_fuel_id => 1,
        :fuel_type_id => 2,
        :unit_type_id => 3,
        :quantity => "9.99",
        :source => 4
      ),
      stub_model(ExternalIssued,
        :unit_fuel_id => 1,
        :fuel_type_id => 2,
        :unit_type_id => 3,
        :quantity => "9.99",
        :source => 4
      )
    ])
  end

  it "renders a list of external_issueds" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
