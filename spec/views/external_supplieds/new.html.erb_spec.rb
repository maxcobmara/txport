require 'spec_helper'

describe "external_supplieds/new" do
  before(:each) do
    assign(:external_supplied, stub_model(ExternalSupplied,
      :unit_fuel_id => 1,
      :fuel_type_id => 1,
      :unit_type_id => 1,
      :quantity => "9.99",
      :source => 1
    ).as_new_record)
  end

  it "renders new external_supplied form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", external_supplieds_path, "post" do
      assert_select "input#external_supplied_unit_fuel_id[name=?]", "external_supplied[unit_fuel_id]"
      assert_select "input#external_supplied_fuel_type_id[name=?]", "external_supplied[fuel_type_id]"
      assert_select "input#external_supplied_unit_type_id[name=?]", "external_supplied[unit_type_id]"
      assert_select "input#external_supplied_quantity[name=?]", "external_supplied[quantity]"
      assert_select "input#external_supplied_source[name=?]", "external_supplied[source]"
    end
  end
end
