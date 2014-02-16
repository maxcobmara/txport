require 'spec_helper'

describe "external_issueds/show" do
  before(:each) do
    @external_issued = assign(:external_issued, stub_model(ExternalIssued,
      :unit_fuel_id => 1,
      :fuel_type_id => 2,
      :unit_type_id => 3,
      :quantity => "9.99",
      :source => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/9.99/)
    rendered.should match(/4/)
  end
end
