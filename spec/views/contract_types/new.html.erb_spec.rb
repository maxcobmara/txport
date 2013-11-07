require 'spec_helper'

describe "contract_types/new" do
  before(:each) do
    assign(:contract_type, stub_model(ContractType,
      :short_name => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new contract_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contract_types_path, "post" do
      assert_select "input#contract_type_short_name[name=?]", "contract_type[short_name]"
      assert_select "input#contract_type_description[name=?]", "contract_type[description]"
    end
  end
end
