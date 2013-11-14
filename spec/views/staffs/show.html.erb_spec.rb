require 'spec_helper'

describe "staffs/show" do
  before(:each) do
    @staff = assign(:staff, stub_model(Staff,
      :id_no => "Id No",
      :rank_id => 1,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Id No/)
    rendered.should match(/1/)
    rendered.should match(/Name/)
  end
end
