require 'spec_helper'

describe "acquired_types/show" do
  before(:each) do
    @acquired_type = assign(:acquired_type, stub_model(AcquiredType,
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
