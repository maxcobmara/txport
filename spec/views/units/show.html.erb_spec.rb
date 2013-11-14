require 'spec_helper'

describe "units/show" do
  before(:each) do
    @unit = assign(:unit, stub_model(Unit,
      :shortname => "Shortname",
      :name => "Name",
      :parent_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Shortname/)
    rendered.should match(/Name/)
    rendered.should match(/1/)
  end
end
