require 'spec_helper'

describe "vehicle_fine_types/edit" do
  before(:each) do
    @vehicle_fine_type = assign(:vehicle_fine_type, stub_model(VehicleFineType,
      :short_name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit vehicle_fine_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vehicle_fine_type_path(@vehicle_fine_type), "post" do
      assert_select "input#vehicle_fine_type_short_name[name=?]", "vehicle_fine_type[short_name]"
      assert_select "input#vehicle_fine_type_description[name=?]", "vehicle_fine_type[description]"
    end
  end
end
