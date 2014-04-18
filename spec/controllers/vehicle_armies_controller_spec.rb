require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe VehicleArmiesController do

  # This should return the minimal set of attributes required to create a valid
  # VehicleArmy. As you add validations to VehicleArmy, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "v_army_no" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # VehicleArmiesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all vehicle_armies as @vehicle_armies" do
      vehicle_army = VehicleArmy.create! valid_attributes
      get :index, {}, valid_session
      assigns(:vehicle_armies).should eq([vehicle_army])
    end
  end

  describe "GET show" do
    it "assigns the requested vehicle_army as @vehicle_army" do
      vehicle_army = VehicleArmy.create! valid_attributes
      get :show, {:id => vehicle_army.to_param}, valid_session
      assigns(:vehicle_army).should eq(vehicle_army)
    end
  end

  describe "GET new" do
    it "assigns a new vehicle_army as @vehicle_army" do
      get :new, {}, valid_session
      assigns(:vehicle_army).should be_a_new(VehicleArmy)
    end
  end

  describe "GET edit" do
    it "assigns the requested vehicle_army as @vehicle_army" do
      vehicle_army = VehicleArmy.create! valid_attributes
      get :edit, {:id => vehicle_army.to_param}, valid_session
      assigns(:vehicle_army).should eq(vehicle_army)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new VehicleArmy" do
        expect {
          post :create, {:vehicle_army => valid_attributes}, valid_session
        }.to change(VehicleArmy, :count).by(1)
      end

      it "assigns a newly created vehicle_army as @vehicle_army" do
        post :create, {:vehicle_army => valid_attributes}, valid_session
        assigns(:vehicle_army).should be_a(VehicleArmy)
        assigns(:vehicle_army).should be_persisted
      end

      it "redirects to the created vehicle_army" do
        post :create, {:vehicle_army => valid_attributes}, valid_session
        response.should redirect_to(VehicleArmy.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved vehicle_army as @vehicle_army" do
        # Trigger the behavior that occurs when invalid params are submitted
        VehicleArmy.any_instance.stub(:save).and_return(false)
        post :create, {:vehicle_army => { "v_army_no" => "invalid value" }}, valid_session
        assigns(:vehicle_army).should be_a_new(VehicleArmy)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        VehicleArmy.any_instance.stub(:save).and_return(false)
        post :create, {:vehicle_army => { "v_army_no" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested vehicle_army" do
        vehicle_army = VehicleArmy.create! valid_attributes
        # Assuming there are no other vehicle_armies in the database, this
        # specifies that the VehicleArmy created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        VehicleArmy.any_instance.should_receive(:update).with({ "v_army_no" => "MyString" })
        put :update, {:id => vehicle_army.to_param, :vehicle_army => { "v_army_no" => "MyString" }}, valid_session
      end

      it "assigns the requested vehicle_army as @vehicle_army" do
        vehicle_army = VehicleArmy.create! valid_attributes
        put :update, {:id => vehicle_army.to_param, :vehicle_army => valid_attributes}, valid_session
        assigns(:vehicle_army).should eq(vehicle_army)
      end

      it "redirects to the vehicle_army" do
        vehicle_army = VehicleArmy.create! valid_attributes
        put :update, {:id => vehicle_army.to_param, :vehicle_army => valid_attributes}, valid_session
        response.should redirect_to(vehicle_army)
      end
    end

    describe "with invalid params" do
      it "assigns the vehicle_army as @vehicle_army" do
        vehicle_army = VehicleArmy.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        VehicleArmy.any_instance.stub(:save).and_return(false)
        put :update, {:id => vehicle_army.to_param, :vehicle_army => { "v_army_no" => "invalid value" }}, valid_session
        assigns(:vehicle_army).should eq(vehicle_army)
      end

      it "re-renders the 'edit' template" do
        vehicle_army = VehicleArmy.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        VehicleArmy.any_instance.stub(:save).and_return(false)
        put :update, {:id => vehicle_army.to_param, :vehicle_army => { "v_army_no" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested vehicle_army" do
      vehicle_army = VehicleArmy.create! valid_attributes
      expect {
        delete :destroy, {:id => vehicle_army.to_param}, valid_session
      }.to change(VehicleArmy, :count).by(-1)
    end

    it "redirects to the vehicle_armies list" do
      vehicle_army = VehicleArmy.create! valid_attributes
      delete :destroy, {:id => vehicle_army.to_param}, valid_session
      response.should redirect_to(vehicle_armies_url)
    end
  end

end