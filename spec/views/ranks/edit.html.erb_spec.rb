require 'spec_helper'

describe "ranks/edit" do
  before(:each) do
    @rank = assign(:rank, stub_model(Rank,
      :shortname => "MyString",
      :name => "MyString"
    ))
  end

  it "renders the edit rank form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", rank_path(@rank), "post" do
      assert_select "input#rank_shortname[name=?]", "rank[shortname]"
      assert_select "input#rank_name[name=?]", "rank[name]"
    end
  end
end
