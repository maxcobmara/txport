require 'spec_helper'

describe "inden_usages/show" do
  before(:each) do
    @inden_usage = assign(:inden_usage, stub_model(IndenUsage,
      :inden_card_id => 1,
      :petrol_ltr => "9.99",
      :petrol_price => "9.99",
      :diesel_ltr => "9.99",
      :diesel_price => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
  end
end
