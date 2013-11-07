require 'spec_helper'

describe "contract_types/edit" do
  before(:each) do
    @contract_type = assign(:contract_type, stub_model(ContractType,
      :short_name => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit contract_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contract_type_path(@contract_type), "post" do
      assert_select "input#contract_type_short_name[name=?]", "contract_type[short_name]"
      assert_select "input#contract_type_description[name=?]", "contract_type[description]"
    end
  end
end
