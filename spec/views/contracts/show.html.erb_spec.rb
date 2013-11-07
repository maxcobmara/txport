require 'spec_helper'

describe "contracts/show" do
  before(:each) do
    @contract = assign(:contract, stub_model(Contract,
      :contract_no => "Contract No",
      :name => "Name",
      :description => "MyText",
      :company_id => 1,
      :value => "9.99",
      :contract_type => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Contract No/)
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/9.99/)
    rendered.should match(/2/)
  end
end
