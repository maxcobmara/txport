require 'spec_helper'

describe "fuel_types/new" do
  before(:each) do
    assign(:fuel_type, stub_model(FuelType,
      :shortname => "MyString",
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new fuel_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", fuel_types_path, "post" do
      assert_select "input#fuel_type_shortname[name=?]", "fuel_type[shortname]"
      assert_select "input#fuel_type_name[name=?]", "fuel_type[name]"
    end
  end
end
