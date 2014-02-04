require 'spec_helper'

describe "expertises/show" do
  before(:each) do
    @expertise = assign(:expertise, stub_model(Expertise,
      :short_name => "Short Name",
      :name => "Name",
      :branch => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Short Name/)
    rendered.should match(/Name/)
    rendered.should match(/1/)
  end
end
