require "spec_helper"

describe ExternalIssuedsController do
  describe "routing" do

    it "routes to #index" do
      get("/external_issueds").should route_to("external_issueds#index")
    end

    it "routes to #new" do
      get("/external_issueds/new").should route_to("external_issueds#new")
    end

    it "routes to #show" do
      get("/external_issueds/1").should route_to("external_issueds#show", :id => "1")
    end

    it "routes to #edit" do
      get("/external_issueds/1/edit").should route_to("external_issueds#edit", :id => "1")
    end

    it "routes to #create" do
      post("/external_issueds").should route_to("external_issueds#create")
    end

    it "routes to #update" do
      put("/external_issueds/1").should route_to("external_issueds#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/external_issueds/1").should route_to("external_issueds#destroy", :id => "1")
    end

  end
end
