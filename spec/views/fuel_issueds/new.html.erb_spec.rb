require 'spec_helper'

describe "fuel_issueds/new" do
  before(:each) do
    assign(:fuel_issued, stub_model(FuelIssued,
      :depot_fuel_id => 1,
      :fuel_type_id => 1,
      :quantity => "9.99"
    ).as_new_record)
  end

  it "renders new fuel_issued form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", fuel_issueds_path, "post" do
      assert_select "input#fuel_issued_depot_fuel_id[name=?]", "fuel_issued[depot_fuel_id]"
      assert_select "input#fuel_issued_fuel_type_id[name=?]", "fuel_issued[fuel_type_id]"
      assert_select "input#fuel_issued_quantity[name=?]", "fuel_issued[quantity]"
    end
  end
end
