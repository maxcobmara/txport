require 'spec_helper'

describe "inden_usages/index" do
  before(:each) do
    assign(:inden_usages, [
      stub_model(IndenUsage,
        :inden_card_id => 1,
        :petrol_ltr => "9.99",
        :petrol_price => "9.99",
        :diesel_ltr => "9.99",
        :diesel_price => "9.99"
      ),
      stub_model(IndenUsage,
        :inden_card_id => 1,
        :petrol_ltr => "9.99",
        :petrol_price => "9.99",
        :diesel_ltr => "9.99",
        :diesel_price => "9.99"
      )
    ])
  end

  it "renders a list of inden_usages" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
