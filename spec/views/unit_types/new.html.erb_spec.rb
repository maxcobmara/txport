require 'spec_helper'

describe "unit_types/new" do
  before(:each) do
    assign(:unit_type, stub_model(UnitType,
      :short_name => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new unit_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", unit_types_path, "post" do
      assert_select "input#unit_type_short_name[name=?]", "unit_type[short_name]"
      assert_select "input#unit_type_description[name=?]", "unit_type[description]"
    end
  end
end
