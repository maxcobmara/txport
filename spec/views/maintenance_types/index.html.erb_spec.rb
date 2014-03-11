require 'spec_helper'

describe "maintenance_types/index" do
  before(:each) do
    assign(:maintenance_types, [
      stub_model(MaintenanceType,
        :type_name => "Type Name",
        :description => "Description"
      ),
      stub_model(MaintenanceType,
        :type_name => "Type Name",
        :description => "Description"
      )
    ])
  end

  it "renders a list of maintenance_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Type Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
