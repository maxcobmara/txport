require 'spec_helper'

describe "vehicle_fines/show" do
  before(:each) do
    @vehicle_fine = assign(:vehicle_fine, stub_model(VehicleFine,
      :code => "Code",
      :vehicle_id => 1,
      :type_id => 2,
      :location => "Location",
      :reason => "Reason",
      :compound => "9.99",
      :receipt_no => "Receipt No",
      :paid_amount => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Location/)
    rendered.should match(/Reason/)
    rendered.should match(/9.99/)
    rendered.should match(/Receipt No/)
    rendered.should match(/9.99/)
  end
end
