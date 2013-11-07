require 'spec_helper'

describe "maintenances/edit" do
  before(:each) do
    @maintenance = assign(:maintenance, stub_model(Maintenance,
      :vehicle_id => 1,
      :work_order_no => "MyString",
      :contract_id => 1,
      :repaired_by => 1,
      :supplied_by => 1
    ))
  end

  it "renders the edit maintenance form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", maintenance_path(@maintenance), "post" do
      assert_select "input#maintenance_vehicle_id[name=?]", "maintenance[vehicle_id]"
      assert_select "input#maintenance_work_order_no[name=?]", "maintenance[work_order_no]"
      assert_select "input#maintenance_contract_id[name=?]", "maintenance[contract_id]"
      assert_select "input#maintenance_repaired_by[name=?]", "maintenance[repaired_by]"
      assert_select "input#maintenance_supplied_by[name=?]", "maintenance[supplied_by]"
    end
  end
end
