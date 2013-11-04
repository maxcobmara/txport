require "spec_helper"

describe VehicleManufacturersController do
  describe "routing" do

    it "routes to #index" do
      get("/vehicle_manufacturers").should route_to("vehicle_manufacturers#index")
    end

    it "routes to #new" do
      get("/vehicle_manufacturers/new").should route_to("vehicle_manufacturers#new")
    end

    it "routes to #show" do
      get("/vehicle_manufacturers/1").should route_to("vehicle_manufacturers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vehicle_manufacturers/1/edit").should route_to("vehicle_manufacturers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vehicle_manufacturers").should route_to("vehicle_manufacturers#create")
    end

    it "routes to #update" do
      put("/vehicle_manufacturers/1").should route_to("vehicle_manufacturers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vehicle_manufacturers/1").should route_to("vehicle_manufacturers#destroy", :id => "1")
    end

  end
end
