require 'spec_helper'

describe "ranks/new" do
  before(:each) do
    assign(:rank, stub_model(Rank,
      :shortname => "MyString",
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new rank form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", ranks_path, "post" do
      assert_select "input#rank_shortname[name=?]", "rank[shortname]"
      assert_select "input#rank_name[name=?]", "rank[name]"
    end
  end
end
