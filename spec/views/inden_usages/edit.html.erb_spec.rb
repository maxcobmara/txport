require 'spec_helper'

describe "inden_usages/edit" do
  before(:each) do
    @inden_usage = assign(:inden_usage, stub_model(IndenUsage,
      :inden_card_id => 1,
      :petrol_ltr => "9.99",
      :petrol_price => "9.99",
      :diesel_ltr => "9.99",
      :diesel_price => "9.99"
    ))
  end

  it "renders the edit inden_usage form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", inden_usage_path(@inden_usage), "post" do
      assert_select "input#inden_usage_inden_card_id[name=?]", "inden_usage[inden_card_id]"
      assert_select "input#inden_usage_petrol_ltr[name=?]", "inden_usage[petrol_ltr]"
      assert_select "input#inden_usage_petrol_price[name=?]", "inden_usage[petrol_price]"
      assert_select "input#inden_usage_diesel_ltr[name=?]", "inden_usage[diesel_ltr]"
      assert_select "input#inden_usage_diesel_price[name=?]", "inden_usage[diesel_price]"
    end
  end
end
