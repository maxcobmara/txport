require 'spec_helper'

describe "expertises/edit" do
  before(:each) do
    @expertise = assign(:expertise, stub_model(Expertise,
      :short_name => "MyString",
      :name => "MyString",
      :branch => 1
    ))
  end

  it "renders the edit expertise form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", expertise_path(@expertise), "post" do
      assert_select "input#expertise_short_name[name=?]", "expertise[short_name]"
      assert_select "input#expertise_name[name=?]", "expertise[name]"
      assert_select "input#expertise_branch[name=?]", "expertise[branch]"
    end
  end
end
