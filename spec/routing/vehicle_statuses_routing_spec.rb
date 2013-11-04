require "spec_helper"

describe VehicleStatusesController do
  describe "routing" do

    it "routes to #index" do
      get("/vehicle_statuses").should route_to("vehicle_statuses#index")
    end

    it "routes to #new" do
      get("/vehicle_statuses/new").should route_to("vehicle_statuses#new")
    end

    it "routes to #show" do
      get("/vehicle_statuses/1").should route_to("vehicle_statuses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vehicle_statuses/1/edit").should route_to("vehicle_statuses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vehicle_statuses").should route_to("vehicle_statuses#create")
    end

    it "routes to #update" do
      put("/vehicle_statuses/1").should route_to("vehicle_statuses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vehicle_statuses/1").should route_to("vehicle_statuses#destroy", :id => "1")
    end

  end
end
