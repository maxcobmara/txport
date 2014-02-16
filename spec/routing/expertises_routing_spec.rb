require "spec_helper"

describe ExpertisesController do
  describe "routing" do

    it "routes to #index" do
      get("/expertises").should route_to("expertises#index")
    end

    it "routes to #new" do
      get("/expertises/new").should route_to("expertises#new")
    end

    it "routes to #show" do
      get("/expertises/1").should route_to("expertises#show", :id => "1")
    end

    it "routes to #edit" do
      get("/expertises/1/edit").should route_to("expertises#edit", :id => "1")
    end

    it "routes to #create" do
      post("/expertises").should route_to("expertises#create")
    end

    it "routes to #update" do
      put("/expertises/1").should route_to("expertises#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/expertises/1").should route_to("expertises#destroy", :id => "1")
    end

  end
end
