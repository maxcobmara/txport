require 'spec_helper'

describe "vehicles/index" do
  before(:each) do
    assign(:vehicles, [
      stub_model(Vehicle,
        :reg_no => "Reg No",
        :chassis_no => "Chassis No",
        :engine_no => "Engine No",
        :manufacturer_id => 1,
        :model => "Model",
        :category_id => 2,
        :price => "9.99",
        :contract_id => 3,
        :status_id => 4
      ),
      stub_model(Vehicle,
        :reg_no => "Reg No",
        :chassis_no => "Chassis No",
        :engine_no => "Engine No",
        :manufacturer_id => 1,
        :model => "Model",
        :category_id => 2,
        :price => "9.99",
        :contract_id => 3,
        :status_id => 4
      )
    ])
  end

  it "renders a list of vehicles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Reg No".to_s, :count => 2
    assert_select "tr>td", :text => "Chassis No".to_s, :count => 2
    assert_select "tr>td", :text => "Engine No".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Model".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
