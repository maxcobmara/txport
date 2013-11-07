require "spec_helper"

describe VehicleFinesController do
  describe "routing" do

    it "routes to #index" do
      get("/vehicle_fines").should route_to("vehicle_fines#index")
    end

    it "routes to #new" do
      get("/vehicle_fines/new").should route_to("vehicle_fines#new")
    end

    it "routes to #show" do
      get("/vehicle_fines/1").should route_to("vehicle_fines#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vehicle_fines/1/edit").should route_to("vehicle_fines#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vehicle_fines").should route_to("vehicle_fines#create")
    end

    it "routes to #update" do
      put("/vehicle_fines/1").should route_to("vehicle_fines#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vehicle_fines/1").should route_to("vehicle_fines#destroy", :id => "1")
    end

  end
end
