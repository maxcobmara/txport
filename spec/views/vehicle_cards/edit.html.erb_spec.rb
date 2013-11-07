require 'spec_helper'

describe "vehicle_cards/edit" do
  before(:each) do
    @vehicle_card = assign(:vehicle_card, stub_model(VehicleCard,
      :vehicle_id => 1,
      :serial_no => "MyString"
    ))
  end

  it "renders the edit vehicle_card form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vehicle_card_path(@vehicle_card), "post" do
      assert_select "input#vehicle_card_vehicle_id[name=?]", "vehicle_card[vehicle_id]"
      assert_select "input#vehicle_card_serial_no[name=?]", "vehicle_card[serial_no]"
    end
  end
end
