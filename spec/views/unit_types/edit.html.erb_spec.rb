require 'spec_helper'

describe "unit_types/edit" do
  before(:each) do
    @unit_type = assign(:unit_type, stub_model(UnitType,
      :short_name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit unit_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", unit_type_path(@unit_type), "post" do
      assert_select "input#unit_type_short_name[name=?]", "unit_type[short_name]"
      assert_select "input#unit_type_description[name=?]", "unit_type[description]"
    end
  end
end
