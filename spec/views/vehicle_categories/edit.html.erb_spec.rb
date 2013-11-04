require 'spec_helper'

describe "vehicle_categories/edit" do
  before(:each) do
    @vehicle_category = assign(:vehicle_category, stub_model(VehicleCategory,
      :short_name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit vehicle_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vehicle_category_path(@vehicle_category), "post" do
      assert_select "input#vehicle_category_short_name[name=?]", "vehicle_category[short_name]"
      assert_select "input#vehicle_category_description[name=?]", "vehicle_category[description]"
    end
  end
end
