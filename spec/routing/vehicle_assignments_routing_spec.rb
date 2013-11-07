require "spec_helper"

describe VehicleAssignmentsController do
  describe "routing" do

    it "routes to #index" do
      get("/vehicle_assignments").should route_to("vehicle_assignments#index")
    end

    it "routes to #new" do
      get("/vehicle_assignments/new").should route_to("vehicle_assignments#new")
    end

    it "routes to #show" do
      get("/vehicle_assignments/1").should route_to("vehicle_assignments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vehicle_assignments/1/edit").should route_to("vehicle_assignments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vehicle_assignments").should route_to("vehicle_assignments#create")
    end

    it "routes to #update" do
      put("/vehicle_assignments/1").should route_to("vehicle_assignments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vehicle_assignments/1").should route_to("vehicle_assignments#destroy", :id => "1")
    end

  end
end
