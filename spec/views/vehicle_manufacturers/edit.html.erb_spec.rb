require 'spec_helper'

describe "vehicle_manufacturers/edit" do
  before(:each) do
    @vehicle_manufacturer = assign(:vehicle_manufacturer, stub_model(VehicleManufacturer,
      :name => "MyString",
      :country => "MyString"
    ))
  end

  it "renders the edit vehicle_manufacturer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vehicle_manufacturer_path(@vehicle_manufacturer), "post" do
      assert_select "input#vehicle_manufacturer_name[name=?]", "vehicle_manufacturer[name]"
      assert_select "input#vehicle_manufacturer_country[name=?]", "vehicle_manufacturer[country]"
    end
  end
end
