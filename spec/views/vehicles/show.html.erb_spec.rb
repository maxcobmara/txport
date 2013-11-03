require 'spec_helper'

describe "vehicles/show" do
  before(:each) do
    @vehicle = assign(:vehicle, stub_model(Vehicle,
      :reg_no => "Reg No",
      :chassis_no => "Chassis No",
      :engine_no => "Engine No",
      :manufacturer_id => 1,
      :model => "Model",
      :category_id => 2,
      :price => "9.99",
      :contract_id => 3,
      :status_id => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Reg No/)
    rendered.should match(/Chassis No/)
    rendered.should match(/Engine No/)
    rendered.should match(/1/)
    rendered.should match(/Model/)
    rendered.should match(/2/)
    rendered.should match(/9.99/)
    rendered.should match(/3/)
    rendered.should match(/4/)
  end
end
