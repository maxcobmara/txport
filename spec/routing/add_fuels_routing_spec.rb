require "spec_helper"

describe AddFuelsController do
  describe "routing" do

    it "routes to #index" do
      get("/add_fuels").should route_to("add_fuels#index")
    end

    it "routes to #new" do
      get("/add_fuels/new").should route_to("add_fuels#new")
    end

    it "routes to #show" do
      get("/add_fuels/1").should route_to("add_fuels#show", :id => "1")
    end

    it "routes to #edit" do
      get("/add_fuels/1/edit").should route_to("add_fuels#edit", :id => "1")
    end

    it "routes to #create" do
      post("/add_fuels").should route_to("add_fuels#create")
    end

    it "routes to #update" do
      put("/add_fuels/1").should route_to("add_fuels#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/add_fuels/1").should route_to("add_fuels#destroy", :id => "1")
    end

  end
end
