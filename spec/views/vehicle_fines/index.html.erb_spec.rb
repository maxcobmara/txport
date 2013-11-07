require 'spec_helper'

describe "vehicle_fines/index" do
  before(:each) do
    assign(:vehicle_fines, [
      stub_model(VehicleFine,
        :code => "Code",
        :vehicle_id => 1,
        :type_id => 2,
        :location => "Location",
        :reason => "Reason",
        :compound => "9.99",
        :receipt_no => "Receipt No",
        :paid_amount => "9.99"
      ),
      stub_model(VehicleFine,
        :code => "Code",
        :vehicle_id => 1,
        :type_id => 2,
        :location => "Location",
        :reason => "Reason",
        :compound => "9.99",
        :receipt_no => "Receipt No",
        :paid_amount => "9.99"
      )
    ])
  end

  it "renders a list of vehicle_fines" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Reason".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "Receipt No".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
