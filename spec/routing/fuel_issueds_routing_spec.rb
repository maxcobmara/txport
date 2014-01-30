require "spec_helper"

describe FuelIssuedsController do
  describe "routing" do

    it "routes to #index" do
      get("/fuel_issueds").should route_to("fuel_issueds#index")
    end

    it "routes to #new" do
      get("/fuel_issueds/new").should route_to("fuel_issueds#new")
    end

    it "routes to #show" do
      get("/fuel_issueds/1").should route_to("fuel_issueds#show", :id => "1")
    end

    it "routes to #edit" do
      get("/fuel_issueds/1/edit").should route_to("fuel_issueds#edit", :id => "1")
    end

    it "routes to #create" do
      post("/fuel_issueds").should route_to("fuel_issueds#create")
    end

    it "routes to #update" do
      put("/fuel_issueds/1").should route_to("fuel_issueds#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/fuel_issueds/1").should route_to("fuel_issueds#destroy", :id => "1")
    end

  end
end
