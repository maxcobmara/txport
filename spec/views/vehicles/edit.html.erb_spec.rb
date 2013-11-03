require 'spec_helper'

describe "vehicles/edit" do
  before(:each) do
    @vehicle = assign(:vehicle, stub_model(Vehicle,
      :reg_no => "MyString",
      :chassis_no => "MyString",
      :engine_no => "MyString",
      :manufacturer_id => 1,
      :model => "MyString",
      :category_id => 1,
      :price => "9.99",
      :contract_id => 1,
      :status_id => 1
    ))
  end

  it "renders the edit vehicle form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vehicle_path(@vehicle), "post" do
      assert_select "input#vehicle_reg_no[name=?]", "vehicle[reg_no]"
      assert_select "input#vehicle_chassis_no[name=?]", "vehicle[chassis_no]"
      assert_select "input#vehicle_engine_no[name=?]", "vehicle[engine_no]"
      assert_select "input#vehicle_manufacturer_id[name=?]", "vehicle[manufacturer_id]"
      assert_select "input#vehicle_model[name=?]", "vehicle[model]"
      assert_select "input#vehicle_category_id[name=?]", "vehicle[category_id]"
      assert_select "input#vehicle_price[name=?]", "vehicle[price]"
      assert_select "input#vehicle_contract_id[name=?]", "vehicle[contract_id]"
      assert_select "input#vehicle_status_id[name=?]", "vehicle[status_id]"
    end
  end
end
