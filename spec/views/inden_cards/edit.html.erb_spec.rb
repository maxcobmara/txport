require 'spec_helper'

describe "inden_cards/edit" do
  before(:each) do
    @inden_card = assign(:inden_card, stub_model(IndenCard,
      :ru_staff => false,
      :serial_no => "MyString",
      :daily_limit => "9.99",
      :monthly_limit => "9.99",
      :staff_id => 1,
      :unit_id => 1
    ))
  end

  it "renders the edit inden_card form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", inden_card_path(@inden_card), "post" do
      assert_select "input#inden_card_ru_staff[name=?]", "inden_card[ru_staff]"
      assert_select "input#inden_card_serial_no[name=?]", "inden_card[serial_no]"
      assert_select "input#inden_card_daily_limit[name=?]", "inden_card[daily_limit]"
      assert_select "input#inden_card_monthly_limit[name=?]", "inden_card[monthly_limit]"
      assert_select "input#inden_card_staff_id[name=?]", "inden_card[staff_id]"
      assert_select "input#inden_card_unit_id[name=?]", "inden_card[unit_id]"
    end
  end
end
