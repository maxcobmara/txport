require "spec_helper"

describe IndenCardsController do
  describe "routing" do

    it "routes to #index" do
      get("/inden_cards").should route_to("inden_cards#index")
    end

    it "routes to #new" do
      get("/inden_cards/new").should route_to("inden_cards#new")
    end

    it "routes to #show" do
      get("/inden_cards/1").should route_to("inden_cards#show", :id => "1")
    end

    it "routes to #edit" do
      get("/inden_cards/1/edit").should route_to("inden_cards#edit", :id => "1")
    end

    it "routes to #create" do
      post("/inden_cards").should route_to("inden_cards#create")
    end

    it "routes to #update" do
      put("/inden_cards/1").should route_to("inden_cards#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/inden_cards/1").should route_to("inden_cards#destroy", :id => "1")
    end

  end
end
