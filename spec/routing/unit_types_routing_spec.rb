require "spec_helper"

describe UnitTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/unit_types").should route_to("unit_types#index")
    end

    it "routes to #new" do
      get("/unit_types/new").should route_to("unit_types#new")
    end

    it "routes to #show" do
      get("/unit_types/1").should route_to("unit_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/unit_types/1/edit").should route_to("unit_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/unit_types").should route_to("unit_types#create")
    end

    it "routes to #update" do
      put("/unit_types/1").should route_to("unit_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/unit_types/1").should route_to("unit_types#destroy", :id => "1")
    end

  end
end
