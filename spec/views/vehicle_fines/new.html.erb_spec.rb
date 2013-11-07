require 'spec_helper'

describe "vehicle_fines/new" do
  before(:each) do
    assign(:vehicle_fine, stub_model(VehicleFine,
      :code => "MyString",
      :vehicle_id => 1,
      :type_id => 1,
      :location => "MyString",
      :reason => "MyString",
      :compound => "9.99",
      :receipt_no => "MyString",
      :paid_amount => "9.99"
    ).as_new_record)
  end

  it "renders new vehicle_fine form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vehicle_fines_path, "post" do
      assert_select "input#vehicle_fine_code[name=?]", "vehicle_fine[code]"
      assert_select "input#vehicle_fine_vehicle_id[name=?]", "vehicle_fine[vehicle_id]"
      assert_select "input#vehicle_fine_type_id[name=?]", "vehicle_fine[type_id]"
      assert_select "input#vehicle_fine_location[name=?]", "vehicle_fine[location]"
      assert_select "input#vehicle_fine_reason[name=?]", "vehicle_fine[reason]"
      assert_select "input#vehicle_fine_compound[name=?]", "vehicle_fine[compound]"
      assert_select "input#vehicle_fine_receipt_no[name=?]", "vehicle_fine[receipt_no]"
      assert_select "input#vehicle_fine_paid_amount[name=?]", "vehicle_fine[paid_amount]"
    end
  end
end
