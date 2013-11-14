require 'spec_helper'

describe "staffs/edit" do
  before(:each) do
    @staff = assign(:staff, stub_model(Staff,
      :id_no => "MyString",
      :rank_id => 1,
      :name => "MyString"
    ))
  end

  it "renders the edit staff form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", staff_path(@staff), "post" do
      assert_select "input#staff_id_no[name=?]", "staff[id_no]"
      assert_select "input#staff_rank_id[name=?]", "staff[rank_id]"
      assert_select "input#staff_name[name=?]", "staff[name]"
    end
  end
end
