require 'spec_helper'

describe "contracts/new" do
  before(:each) do
    assign(:contract, stub_model(Contract,
      :contract_no => "MyString",
      :name => "MyString",
      :description => "MyText",
      :company_id => 1,
      :value => "9.99",
      :contract_type => 1
    ).as_new_record)
  end

  it "renders new contract form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contracts_path, "post" do
      assert_select "input#contract_contract_no[name=?]", "contract[contract_no]"
      assert_select "input#contract_name[name=?]", "contract[name]"
      assert_select "textarea#contract_description[name=?]", "contract[description]"
      assert_select "input#contract_company_id[name=?]", "contract[company_id]"
      assert_select "input#contract_value[name=?]", "contract[value]"
      assert_select "input#contract_contract_type[name=?]", "contract[contract_type]"
    end
  end
end
