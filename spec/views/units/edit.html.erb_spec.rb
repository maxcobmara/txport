require 'spec_helper'

describe "units/edit" do
  before(:each) do
    @unit = assign(:unit, stub_model(Unit,
      :shortname => "MyString",
      :name => "MyString",
      :parent_id => 1
    ))
  end

  it "renders the edit unit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", unit_path(@unit), "post" do
      assert_select "input#unit_shortname[name=?]", "unit[shortname]"
      assert_select "input#unit_name[name=?]", "unit[name]"
      assert_select "input#unit_parent_id[name=?]", "unit[parent_id]"
    end
  end
end
