require 'spec_helper'

describe "staffs/index" do
  before(:each) do
    assign(:staffs, [
      stub_model(Staff,
        :id_no => "Id No",
        :rank_id => 1,
        :name => "Name"
      ),
      stub_model(Staff,
        :id_no => "Id No",
        :rank_id => 1,
        :name => "Name"
      )
    ])
  end

  it "renders a list of staffs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Id No".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
