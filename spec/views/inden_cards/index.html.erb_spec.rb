require 'spec_helper'

describe "inden_cards/index" do
  before(:each) do
    assign(:inden_cards, [
      stub_model(IndenCard,
        :ru_staff => false,
        :serial_no => "Serial No",
        :daily_limit => "9.99",
        :monthly_limit => "9.99",
        :staff_id => 1,
        :unit_id => 2
      ),
      stub_model(IndenCard,
        :ru_staff => false,
        :serial_no => "Serial No",
        :daily_limit => "9.99",
        :monthly_limit => "9.99",
        :staff_id => 1,
        :unit_id => 2
      )
    ])
  end

  it "renders a list of inden_cards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Serial No".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
