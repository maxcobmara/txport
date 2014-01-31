require 'spec_helper'

describe "inden_cards/show" do
  before(:each) do
    @inden_card = assign(:inden_card, stub_model(IndenCard,
      :ru_staff => false,
      :serial_no => "Serial No",
      :daily_limit => "9.99",
      :monthly_limit => "9.99",
      :staff_id => 1,
      :unit_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    rendered.should match(/Serial No/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
