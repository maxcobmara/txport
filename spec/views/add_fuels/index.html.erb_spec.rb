require 'spec_helper'

describe "add_fuels/index" do
  before(:each) do
    assign(:add_fuels, [
      stub_model(AddFuel,
        :unit_fuel_id => 1,
        :fuel_type_id => 2,
        :description => "Description",
        :quantity => "9.99",
        :unit_type_id => 3
      ),
      stub_model(AddFuel,
        :unit_fuel_id => 1,
        :fuel_type_id => 2,
        :description => "Description",
        :quantity => "9.99",
        :unit_type_id => 3
      )
    ])
  end

  it "renders a list of add_fuels" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
