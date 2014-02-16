require "spec_helper"

describe DepotFuelsController do
  describe "routing" do

    it "routes to #index" do
      get("/depot_fuels").should route_to("depot_fuels#index")
    end

    it "routes to #new" do
      get("/depot_fuels/new").should route_to("depot_fuels#new")
    end

    it "routes to #show" do
      get("/depot_fuels/1").should route_to("depot_fuels#show", :id => "1")
    end

    it "routes to #edit" do
      get("/depot_fuels/1/edit").should route_to("depot_fuels#edit", :id => "1")
    end

    it "routes to #create" do
      post("/depot_fuels").should route_to("depot_fuels#create")
    end

    it "routes to #update" do
      put("/depot_fuels/1").should route_to("depot_fuels#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/depot_fuels/1").should route_to("depot_fuels#destroy", :id => "1")
    end

  end
end
