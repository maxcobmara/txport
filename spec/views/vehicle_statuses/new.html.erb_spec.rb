require 'spec_helper'

describe "vehicle_statuses/new" do
  before(:each) do
    assign(:vehicle_status, stub_model(VehicleStatus,
      :short_name => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new vehicle_status form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vehicle_statuses_path, "post" do
      assert_select "input#vehicle_status_short_name[name=?]", "vehicle_status[short_name]"
      assert_select "input#vehicle_status_description[name=?]", "vehicle_status[description]"
    end
  end
end
