require "spec_helper"

describe ContractTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/contract_types").should route_to("contract_types#index")
    end

    it "routes to #new" do
      get("/contract_types/new").should route_to("contract_types#new")
    end

    it "routes to #show" do
      get("/contract_types/1").should route_to("contract_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/contract_types/1/edit").should route_to("contract_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/contract_types").should route_to("contract_types#create")
    end

    it "routes to #update" do
      put("/contract_types/1").should route_to("contract_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/contract_types/1").should route_to("contract_types#destroy", :id => "1")
    end

  end
end
