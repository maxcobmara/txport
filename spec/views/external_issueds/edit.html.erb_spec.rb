require 'spec_helper'

describe "external_issueds/edit" do
  before(:each) do
    @external_issued = assign(:external_issued, stub_model(ExternalIssued,
      :unit_fuel_id => 1,
      :fuel_type_id => 1,
      :unit_type_id => 1,
      :quantity => "9.99",
      :source => 1
    ))
  end

  it "renders the edit external_issued form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", external_issued_path(@external_issued), "post" do
      assert_select "input#external_issued_unit_fuel_id[name=?]", "external_issued[unit_fuel_id]"
      assert_select "input#external_issued_fuel_type_id[name=?]", "external_issued[fuel_type_id]"
      assert_select "input#external_issued_unit_type_id[name=?]", "external_issued[unit_type_id]"
      assert_select "input#external_issued_quantity[name=?]", "external_issued[quantity]"
      assert_select "input#external_issued_source[name=?]", "external_issued[source]"
    end
  end
end
