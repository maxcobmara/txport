require "spec_helper"

describe IndenUsagesController do
  describe "routing" do

    it "routes to #index" do
      get("/inden_usages").should route_to("inden_usages#index")
    end

    it "routes to #new" do
      get("/inden_usages/new").should route_to("inden_usages#new")
    end

    it "routes to #show" do
      get("/inden_usages/1").should route_to("inden_usages#show", :id => "1")
    end

    it "routes to #edit" do
      get("/inden_usages/1/edit").should route_to("inden_usages#edit", :id => "1")
    end

    it "routes to #create" do
      post("/inden_usages").should route_to("inden_usages#create")
    end

    it "routes to #update" do
      put("/inden_usages/1").should route_to("inden_usages#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/inden_usages/1").should route_to("inden_usages#destroy", :id => "1")
    end

  end
end
