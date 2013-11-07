require 'spec_helper'

describe "maintenances/index" do
  before(:each) do
    assign(:maintenances, [
      stub_model(Maintenance,
        :vehicle_id => 1,
        :work_order_no => "Work Order No",
        :contract_id => 2,
        :repaired_by => 3,
        :supplied_by => 4
      ),
      stub_model(Maintenance,
        :vehicle_id => 1,
        :work_order_no => "Work Order No",
        :contract_id => 2,
        :repaired_by => 3,
        :supplied_by => 4
      )
    ])
  end

  it "renders a list of maintenances" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Work Order No".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
