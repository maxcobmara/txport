require 'spec_helper'

describe "contract_types/index" do
  before(:each) do
    assign(:contract_types, [
      stub_model(ContractType,
        :short_name => "Short Name",
        :description => "Description"
      ),
      stub_model(ContractType,
        :short_name => "Short Name",
        :description => "Description"
      )
    ])
  end

  it "renders a list of contract_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Short Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
