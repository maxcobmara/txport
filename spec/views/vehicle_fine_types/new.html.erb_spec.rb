require 'spec_helper'

describe "vehicle_fine_types/new" do
  before(:each) do
    assign(:vehicle_fine_type, stub_model(VehicleFineType,
      :short_name => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new vehicle_fine_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vehicle_fine_types_path, "post" do
      assert_select "input#vehicle_fine_type_short_name[name=?]", "vehicle_fine_type[short_name]"
      assert_select "input#vehicle_fine_type_description[name=?]", "vehicle_fine_type[description]"
    end
  end
end
