require 'spec_helper'

describe "companies/show" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
      :name => "Name",
      :address => "MyText",
      :contact_person => "Contact Person",
      :phone => "Phone",
      :fax => "Fax",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Contact Person/)
    rendered.should match(/Phone/)
    rendered.should match(/Fax/)
    rendered.should match(/Email/)
  end
end
