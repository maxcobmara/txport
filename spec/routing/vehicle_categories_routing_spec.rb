require "spec_helper"

describe VehicleCategoriesController do
  describe "routing" do

    it "routes to #index" do
      get("/vehicle_categories").should route_to("vehicle_categories#index")
    end

    it "routes to #new" do
      get("/vehicle_categories/new").should route_to("vehicle_categories#new")
    end

    it "routes to #show" do
      get("/vehicle_categories/1").should route_to("vehicle_categories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vehicle_categories/1/edit").should route_to("vehicle_categories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vehicle_categories").should route_to("vehicle_categories#create")
    end

    it "routes to #update" do
      put("/vehicle_categories/1").should route_to("vehicle_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vehicle_categories/1").should route_to("vehicle_categories#destroy", :id => "1")
    end

  end
end
