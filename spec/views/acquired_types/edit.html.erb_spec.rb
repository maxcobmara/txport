require 'spec_helper'

describe "acquired_types/edit" do
  before(:each) do
    @acquired_type = assign(:acquired_type, stub_model(AcquiredType,
      :short_name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit acquired_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", acquired_type_path(@acquired_type), "post" do
      assert_select "input#acquired_type_short_name[name=?]", "acquired_type[short_name]"
      assert_select "input#acquired_type_description[name=?]", "acquired_type[description]"
    end
  end
end
