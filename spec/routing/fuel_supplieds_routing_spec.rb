require "spec_helper"

describe FuelSuppliedsController do
  describe "routing" do

    it "routes to #index" do
      get("/fuel_supplieds").should route_to("fuel_supplieds#index")
    end

    it "routes to #new" do
      get("/fuel_supplieds/new").should route_to("fuel_supplieds#new")
    end

    it "routes to #show" do
      get("/fuel_supplieds/1").should route_to("fuel_supplieds#show", :id => "1")
    end

    it "routes to #edit" do
      get("/fuel_supplieds/1/edit").should route_to("fuel_supplieds#edit", :id => "1")
    end

    it "routes to #create" do
      post("/fuel_supplieds").should route_to("fuel_supplieds#create")
    end

    it "routes to #update" do
      put("/fuel_supplieds/1").should route_to("fuel_supplieds#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/fuel_supplieds/1").should route_to("fuel_supplieds#destroy", :id => "1")
    end

  end
end
