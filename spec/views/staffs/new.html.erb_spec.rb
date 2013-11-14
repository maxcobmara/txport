require 'spec_helper'

describe "staffs/new" do
  before(:each) do
    assign(:staff, stub_model(Staff,
      :id_no => "MyString",
      :rank_id => 1,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new staff form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", staffs_path, "post" do
      assert_select "input#staff_id_no[name=?]", "staff[id_no]"
      assert_select "input#staff_rank_id[name=?]", "staff[rank_id]"
      assert_select "input#staff_name[name=?]", "staff[name]"
    end
  end
end
