require 'spec_helper'

describe "contracts/index" do
  before(:each) do
    assign(:contracts, [
      stub_model(Contract,
        :contract_no => "Contract No",
        :name => "Name",
        :description => "MyText",
        :company_id => 1,
        :value => "9.99",
        :contract_type => 2
      ),
      stub_model(Contract,
        :contract_no => "Contract No",
        :name => "Name",
        :description => "MyText",
        :company_id => 1,
        :value => "9.99",
        :contract_type => 2
      )
    ])
  end

  it "renders a list of contracts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Contract No".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
