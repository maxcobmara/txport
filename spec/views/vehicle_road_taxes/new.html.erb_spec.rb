require 'spec_helper'

describe "vehicle_road_taxes/new" do
  before(:each) do
    assign(:vehicle_road_tax, stub_model(VehicleRoadTax,
      :vehicle_id => 1,
      :amount => "9.99"
    ).as_new_record)
  end

  it "renders new vehicle_road_tax form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vehicle_road_taxes_path, "post" do
      assert_select "input#vehicle_road_tax_vehicle_id[name=?]", "vehicle_road_tax[vehicle_id]"
      assert_select "input#vehicle_road_tax_amount[name=?]", "vehicle_road_tax[amount]"
    end
  end
end
