require 'spec_helper'

describe "unit_fuels/index" do
  before(:each) do
    assign(:unit_fuels, [
      stub_model(UnitFuel,
        :unit_id => 1,
        :d_vessel => "9.99",
        :d_vehicle => "9.99",
        :d_misctool => "9.99",
        :d_boat => "9.99",
        :p_vehicle => "9.99",
        :p_misctool => "9.99",
        :p_boat => "9.99"
      ),
      stub_model(UnitFuel,
        :unit_id => 1,
        :d_vessel => "9.99",
        :d_vehicle => "9.99",
        :d_misctool => "9.99",
        :d_boat => "9.99",
        :p_vehicle => "9.99",
        :p_misctool => "9.99",
        :p_boat => "9.99"
      )
    ])
  end

  it "renders a list of unit_fuels" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
