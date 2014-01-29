require 'spec_helper'

describe "fuel_issueds/edit" do
  before(:each) do
    @fuel_issued = assign(:fuel_issued, stub_model(FuelIssued,
      :depot_fuel_id => 1,
      :fuel_type_id => 1,
      :quantity => "9.99"
    ))
  end

  it "renders the edit fuel_issued form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", fuel_issued_path(@fuel_issued), "post" do
      assert_select "input#fuel_issued_depot_fuel_id[name=?]", "fuel_issued[depot_fuel_id]"
      assert_select "input#fuel_issued_fuel_type_id[name=?]", "fuel_issued[fuel_type_id]"
      assert_select "input#fuel_issued_quantity[name=?]", "fuel_issued[quantity]"
    end
  end
end
