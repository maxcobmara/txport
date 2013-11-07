require 'spec_helper'

describe "maintenances/show" do
  before(:each) do
    @maintenance = assign(:maintenance, stub_model(Maintenance,
      :vehicle_id => 1,
      :work_order_no => "Work Order No",
      :contract_id => 2,
      :repaired_by => 3,
      :supplied_by => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Work Order No/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
  end
end
