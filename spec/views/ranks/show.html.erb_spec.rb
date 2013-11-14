require 'spec_helper'

describe "ranks/show" do
  before(:each) do
    @rank = assign(:rank, stub_model(Rank,
      :shortname => "Shortname",
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Shortname/)
    rendered.should match(/Name/)
  end
end
