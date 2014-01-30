require "spec_helper"

describe FuelBalancesController do
  describe "routing" do

    it "routes to #index" do
      get("/fuel_balances").should route_to("fuel_balances#index")
    end

    it "routes to #new" do
      get("/fuel_balances/new").should route_to("fuel_balances#new")
    end

    it "routes to #show" do
      get("/fuel_balances/1").should route_to("fuel_balances#show", :id => "1")
    end

    it "routes to #edit" do
      get("/fuel_balances/1/edit").should route_to("fuel_balances#edit", :id => "1")
    end

    it "routes to #create" do
      post("/fuel_balances").should route_to("fuel_balances#create")
    end

    it "routes to #update" do
      put("/fuel_balances/1").should route_to("fuel_balances#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/fuel_balances/1").should route_to("fuel_balances#destroy", :id => "1")
    end

  end
end
