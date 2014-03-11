require 'spec_helper'

describe "maintenance_types/new" do
  before(:each) do
    assign(:maintenance_type, stub_model(MaintenanceType,
      :type_name => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new maintenance_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", maintenance_types_path, "post" do
      assert_select "input#maintenance_type_type_name[name=?]", "maintenance_type[type_name]"
      assert_select "input#maintenance_type_description[name=?]", "maintenance_type[description]"
    end
  end
end
