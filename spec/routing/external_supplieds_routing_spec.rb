require "spec_helper"

describe ExternalSuppliedsController do
  describe "routing" do

    it "routes to #index" do
      get("/external_supplieds").should route_to("external_supplieds#index")
    end

    it "routes to #new" do
      get("/external_supplieds/new").should route_to("external_supplieds#new")
    end

    it "routes to #show" do
      get("/external_supplieds/1").should route_to("external_supplieds#show", :id => "1")
    end

    it "routes to #edit" do
      get("/external_supplieds/1/edit").should route_to("external_supplieds#edit", :id => "1")
    end

    it "routes to #create" do
      post("/external_supplieds").should route_to("external_supplieds#create")
    end

    it "routes to #update" do
      put("/external_supplieds/1").should route_to("external_supplieds#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/external_supplieds/1").should route_to("external_supplieds#destroy", :id => "1")
    end

  end
end
