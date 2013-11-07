require "spec_helper"

describe VehicleRoadTaxesController do
  describe "routing" do

    it "routes to #index" do
      get("/vehicle_road_taxes").should route_to("vehicle_road_taxes#index")
    end

    it "routes to #new" do
      get("/vehicle_road_taxes/new").should route_to("vehicle_road_taxes#new")
    end

    it "routes to #show" do
      get("/vehicle_road_taxes/1").should route_to("vehicle_road_taxes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vehicle_road_taxes/1/edit").should route_to("vehicle_road_taxes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vehicle_road_taxes").should route_to("vehicle_road_taxes#create")
    end

    it "routes to #update" do
      put("/vehicle_road_taxes/1").should route_to("vehicle_road_taxes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vehicle_road_taxes/1").should route_to("vehicle_road_taxes#destroy", :id => "1")
    end

  end
end
