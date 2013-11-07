require "spec_helper"

describe VehicleCardsController do
  describe "routing" do

    it "routes to #index" do
      get("/vehicle_cards").should route_to("vehicle_cards#index")
    end

    it "routes to #new" do
      get("/vehicle_cards/new").should route_to("vehicle_cards#new")
    end

    it "routes to #show" do
      get("/vehicle_cards/1").should route_to("vehicle_cards#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vehicle_cards/1/edit").should route_to("vehicle_cards#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vehicle_cards").should route_to("vehicle_cards#create")
    end

    it "routes to #update" do
      put("/vehicle_cards/1").should route_to("vehicle_cards#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vehicle_cards/1").should route_to("vehicle_cards#destroy", :id => "1")
    end

  end
end
