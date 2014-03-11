require 'spec_helper'

describe "maintenance_types/show" do
  before(:each) do
    @maintenance_type = assign(:maintenance_type, stub_model(MaintenanceType,
      :type_name => "Type Name",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Type Name/)
    rendered.should match(/Description/)
  end
end
