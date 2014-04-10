require "spec_helper"

describe VehicleNosController do
  describe "routing" do

    it "routes to #index" do
      get("/vehicle_nos").should route_to("vehicle_nos#index")
    end

    it "routes to #new" do
      get("/vehicle_nos/new").should route_to("vehicle_nos#new")
    end

    it "routes to #show" do
      get("/vehicle_nos/1").should route_to("vehicle_nos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vehicle_nos/1/edit").should route_to("vehicle_nos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vehicle_nos").should route_to("vehicle_nos#create")
    end

    it "routes to #update" do
      put("/vehicle_nos/1").should route_to("vehicle_nos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vehicle_nos/1").should route_to("vehicle_nos#destroy", :id => "1")
    end

  end
end
