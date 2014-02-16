require 'spec_helper'

describe "expertises/index" do
  before(:each) do
    assign(:expertises, [
      stub_model(Expertise,
        :short_name => "Short Name",
        :name => "Name",
        :branch => 1
      ),
      stub_model(Expertise,
        :short_name => "Short Name",
        :name => "Name",
        :branch => 1
      )
    ])
  end

  it "renders a list of expertises" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Short Name".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
