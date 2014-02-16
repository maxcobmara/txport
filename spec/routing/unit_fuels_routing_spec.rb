require "spec_helper"

describe UnitFuelsController do
  describe "routing" do

    it "routes to #index" do
      get("/unit_fuels").should route_to("unit_fuels#index")
    end

    it "routes to #new" do
      get("/unit_fuels/new").should route_to("unit_fuels#new")
    end

    it "routes to #show" do
      get("/unit_fuels/1").should route_to("unit_fuels#show", :id => "1")
    end

    it "routes to #edit" do
      get("/unit_fuels/1/edit").should route_to("unit_fuels#edit", :id => "1")
    end

    it "routes to #create" do
      post("/unit_fuels").should route_to("unit_fuels#create")
    end

    it "routes to #update" do
      put("/unit_fuels/1").should route_to("unit_fuels#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/unit_fuels/1").should route_to("unit_fuels#destroy", :id => "1")
    end

  end
end
