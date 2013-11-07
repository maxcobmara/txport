require "spec_helper"

describe VehicleFineTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/vehicle_fine_types").should route_to("vehicle_fine_types#index")
    end

    it "routes to #new" do
      get("/vehicle_fine_types/new").should route_to("vehicle_fine_types#new")
    end

    it "routes to #show" do
      get("/vehicle_fine_types/1").should route_to("vehicle_fine_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vehicle_fine_types/1/edit").should route_to("vehicle_fine_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vehicle_fine_types").should route_to("vehicle_fine_types#create")
    end

    it "routes to #update" do
      put("/vehicle_fine_types/1").should route_to("vehicle_fine_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vehicle_fine_types/1").should route_to("vehicle_fine_types#destroy", :id => "1")
    end

  end
end
