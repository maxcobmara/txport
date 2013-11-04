require 'spec_helper'

describe "vehicle_categories/new" do
  before(:each) do
    assign(:vehicle_category, stub_model(VehicleCategory,
      :short_name => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new vehicle_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", vehicle_categories_path, "post" do
      assert_select "input#vehicle_category_short_name[name=?]", "vehicle_category[short_name]"
      assert_select "input#vehicle_category_description[name=?]", "vehicle_category[description]"
    end
  end
end
