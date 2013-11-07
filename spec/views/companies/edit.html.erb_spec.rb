require 'spec_helper'

describe "companies/edit" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
      :name => "MyString",
      :address => "MyText",
      :contact_person => "MyString",
      :phone => "MyString",
      :fax => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", company_path(@company), "post" do
      assert_select "input#company_name[name=?]", "company[name]"
      assert_select "textarea#company_address[name=?]", "company[address]"
      assert_select "input#company_contact_person[name=?]", "company[contact_person]"
      assert_select "input#company_phone[name=?]", "company[phone]"
      assert_select "input#company_fax[name=?]", "company[fax]"
      assert_select "input#company_email[name=?]", "company[email]"
    end
  end
end
