require 'spec_helper'

describe "contract_types/show" do
  before(:each) do
    @contract_type = assign(:contract_type, stub_model(ContractType,
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
