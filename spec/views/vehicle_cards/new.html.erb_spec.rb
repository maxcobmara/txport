require 'spec_helper'

describe "vehicle_cards/new" do
  before(:each) do
    assign(:vehicle_card, stub_model(VehicleCard,
      :vehicle_id => 1,
      :serial_no => "MyString"
    ).as_new_record)
  end

  it "renders new vehicle_card form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vehicle_cards_path, "post" do
      assert_select "input#vehicle_card_vehicle_id[name=?]", "vehicle_card[vehicle_id]"
      assert_select "input#vehicle_card_serial_no[name=?]", "vehicle_card[serial_no]"
    end
  end
end
