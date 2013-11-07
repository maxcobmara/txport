require 'spec_helper'

describe "companies/index" do
  before(:each) do
    assign(:companies, [
      stub_model(Company,
        :name => "Name",
        :address => "MyText",
        :contact_person => "Contact Person",
        :phone => "Phone",
        :fax => "Fax",
        :email => "Email"
      ),
      stub_model(Company,
        :name => "Name",
        :address => "MyText",
        :contact_person => "Contact Person",
        :phone => "Phone",
        :fax => "Fax",
        :email => "Email"
      )
    ])
  end

  it "renders a list of companies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Person".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Fax".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
