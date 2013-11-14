require 'spec_helper'

describe "fuel_types/show" do
  before(:each) do
    @fuel_type = assign(:fuel_type, stub_model(FuelType,
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
