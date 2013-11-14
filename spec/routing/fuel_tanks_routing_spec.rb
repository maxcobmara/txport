require "spec_helper"

describe FuelTanksController do
  describe "routing" do

    it "routes to #index" do
      get("/fuel_tanks").should route_to("fuel_tanks#index")
    end

    it "routes to #new" do
      get("/fuel_tanks/new").should route_to("fuel_tanks#new")
    end

    it "routes to #show" do
      get("/fuel_tanks/1").should route_to("fuel_tanks#show", :id => "1")
    end

    it "routes to #edit" do
      get("/fuel_tanks/1/edit").should route_to("fuel_tanks#edit", :id => "1")
    end

    it "routes to #create" do
      post("/fuel_tanks").should route_to("fuel_tanks#create")
    end

    it "routes to #update" do
      put("/fuel_tanks/1").should route_to("fuel_tanks#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/fuel_tanks/1").should route_to("fuel_tanks#destroy", :id => "1")
    end

  end
end
