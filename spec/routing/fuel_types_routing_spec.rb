require "spec_helper"

describe FuelTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/fuel_types").should route_to("fuel_types#index")
    end

    it "routes to #new" do
      get("/fuel_types/new").should route_to("fuel_types#new")
    end

    it "routes to #show" do
      get("/fuel_types/1").should route_to("fuel_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/fuel_types/1/edit").should route_to("fuel_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/fuel_types").should route_to("fuel_types#create")
    end

    it "routes to #update" do
      put("/fuel_types/1").should route_to("fuel_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/fuel_types/1").should route_to("fuel_types#destroy", :id => "1")
    end

  end
end
