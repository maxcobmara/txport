require 'spec_helper'

describe "unit_types/show" do
  before(:each) do
    @unit_type = assign(:unit_type, stub_model(UnitType,
      :short_name => "Short Name",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Short Name/)
    rendered.should match(/Description/)
  end
end
