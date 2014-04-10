require "spec_helper"

describe VehicleArmiesController do
  describe "routing" do

    it "routes to #index" do
      get("/vehicle_armies").should route_to("vehicle_armies#index")
    end

    it "routes to #new" do
      get("/vehicle_armies/new").should route_to("vehicle_armies#new")
    end

    it "routes to #show" do
      get("/vehicle_armies/1").should route_to("vehicle_armies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vehicle_armies/1/edit").should route_to("vehicle_armies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vehicle_armies").should route_to("vehicle_armies#create")
    end

    it "routes to #update" do
      put("/vehicle_armies/1").should route_to("vehicle_armies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vehicle_armies/1").should route_to("vehicle_armies#destroy", :id => "1")
    end

  end
end
