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

describe FuelTypesController do

  # This should return the minimal set of attributes required to create a valid
  # FuelType. As you add validations to FuelType, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "shortname" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FuelTypesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all fuel_types as @fuel_types" do
      fuel_type = FuelType.create! valid_attributes
      get :index, {}, valid_session
      assigns(:fuel_types).should eq([fuel_type])
    end
  end

  describe "GET show" do
    it "assigns the requested fuel_type as @fuel_type" do
      fuel_type = FuelType.create! valid_attributes
      get :show, {:id => fuel_type.to_param}, valid_session
      assigns(:fuel_type).should eq(fuel_type)
    end
  end

  describe "GET new" do
    it "assigns a new fuel_type as @fuel_type" do
      get :new, {}, valid_session
      assigns(:fuel_type).should be_a_new(FuelType)
    end
  end

  describe "GET edit" do
    it "assigns the requested fuel_type as @fuel_type" do
      fuel_type = FuelType.create! valid_attributes
      get :edit, {:id => fuel_type.to_param}, valid_session
      assigns(:fuel_type).should eq(fuel_type)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new FuelType" do
        expect {
          post :create, {:fuel_type => valid_attributes}, valid_session
        }.to change(FuelType, :count).by(1)
      end

      it "assigns a newly created fuel_type as @fuel_type" do
        post :create, {:fuel_type => valid_attributes}, valid_session
        assigns(:fuel_type).should be_a(FuelType)
        assigns(:fuel_type).should be_persisted
      end

      it "redirects to the created fuel_type" do
        post :create, {:fuel_type => valid_attributes}, valid_session
        response.should redirect_to(FuelType.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved fuel_type as @fuel_type" do
        # Trigger the behavior that occurs when invalid params are submitted
        FuelType.any_instance.stub(:save).and_return(false)
        post :create, {:fuel_type => { "shortname" => "invalid value" }}, valid_session
        assigns(:fuel_type).should be_a_new(FuelType)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        FuelType.any_instance.stub(:save).and_return(false)
        post :create, {:fuel_type => { "shortname" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested fuel_type" do
        fuel_type = FuelType.create! valid_attributes
        # Assuming there are no other fuel_types in the database, this
        # specifies that the FuelType created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        FuelType.any_instance.should_receive(:update).with({ "shortname" => "MyString" })
        put :update, {:id => fuel_type.to_param, :fuel_type => { "shortname" => "MyString" }}, valid_session
      end

      it "assigns the requested fuel_type as @fuel_type" do
        fuel_type = FuelType.create! valid_attributes
        put :update, {:id => fuel_type.to_param, :fuel_type => valid_attributes}, valid_session
        assigns(:fuel_type).should eq(fuel_type)
      end

      it "redirects to the fuel_type" do
        fuel_type = FuelType.create! valid_attributes
        put :update, {:id => fuel_type.to_param, :fuel_type => valid_attributes}, valid_session
        response.should redirect_to(fuel_type)
      end
    end

    describe "with invalid params" do
      it "assigns the fuel_type as @fuel_type" do
        fuel_type = FuelType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FuelType.any_instance.stub(:save).and_return(false)
        put :update, {:id => fuel_type.to_param, :fuel_type => { "shortname" => "invalid value" }}, valid_session
        assigns(:fuel_type).should eq(fuel_type)
      end

      it "re-renders the 'edit' template" do
        fuel_type = FuelType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        FuelType.any_instance.stub(:save).and_return(false)
        put :update, {:id => fuel_type.to_param, :fuel_type => { "shortname" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested fuel_type" do
      fuel_type = FuelType.create! valid_attributes
      expect {
        delete :destroy, {:id => fuel_type.to_param}, valid_session
      }.to change(FuelType, :count).by(-1)
    end

    it "redirects to the fuel_types list" do
      fuel_type = FuelType.create! valid_attributes
      delete :destroy, {:id => fuel_type.to_param}, valid_session
      response.should redirect_to(fuel_types_url)
    end
  end

end
