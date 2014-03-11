require "spec_helper"

describe MaintenanceTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/maintenance_types").should route_to("maintenance_types#index")
    end

    it "routes to #new" do
      get("/maintenance_types/new").should route_to("maintenance_types#new")
    end

    it "routes to #show" do
      get("/maintenance_types/1").should route_to("maintenance_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/maintenance_types/1/edit").should route_to("maintenance_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/maintenance_types").should route_to("maintenance_types#create")
    end

    it "routes to #update" do
      put("/maintenance_types/1").should route_to("maintenance_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/maintenance_types/1").should route_to("maintenance_types#destroy", :id => "1")
    end

  end
end
