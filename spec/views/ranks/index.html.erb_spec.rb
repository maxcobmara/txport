require 'spec_helper'

describe "ranks/index" do
  before(:each) do
    assign(:ranks, [
      stub_model(Rank,
        :shortname => "Shortname",
        :name => "Name"
      ),
      stub_model(Rank,
        :shortname => "Shortname",
        :name => "Name"
      )
    ])
  end

  it "renders a list of ranks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Shortname".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
