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

describe IndenCardsController do

  # This should return the minimal set of attributes required to create a valid
  # IndenCard. As you add validations to IndenCard, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "ru_staff" => "false" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # IndenCardsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all inden_cards as @inden_cards" do
      inden_card = IndenCard.create! valid_attributes
      get :index, {}, valid_session
      assigns(:inden_cards).should eq([inden_card])
    end
  end

  describe "GET show" do
    it "assigns the requested inden_card as @inden_card" do
      inden_card = IndenCard.create! valid_attributes
      get :show, {:id => inden_card.to_param}, valid_session
      assigns(:inden_card).should eq(inden_card)
    end
  end

  describe "GET new" do
    it "assigns a new inden_card as @inden_card" do
      get :new, {}, valid_session
      assigns(:inden_card).should be_a_new(IndenCard)
    end
  end

  describe "GET edit" do
    it "assigns the requested inden_card as @inden_card" do
      inden_card = IndenCard.create! valid_attributes
      get :edit, {:id => inden_card.to_param}, valid_session
      assigns(:inden_card).should eq(inden_card)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new IndenCard" do
        expect {
          post :create, {:inden_card => valid_attributes}, valid_session
        }.to change(IndenCard, :count).by(1)
      end

      it "assigns a newly created inden_card as @inden_card" do
        post :create, {:inden_card => valid_attributes}, valid_session
        assigns(:inden_card).should be_a(IndenCard)
        assigns(:inden_card).should be_persisted
      end

      it "redirects to the created inden_card" do
        post :create, {:inden_card => valid_attributes}, valid_session
        response.should redirect_to(IndenCard.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved inden_card as @inden_card" do
        # Trigger the behavior that occurs when invalid params are submitted
        IndenCard.any_instance.stub(:save).and_return(false)
        post :create, {:inden_card => { "ru_staff" => "invalid value" }}, valid_session
        assigns(:inden_card).should be_a_new(IndenCard)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        IndenCard.any_instance.stub(:save).and_return(false)
        post :create, {:inden_card => { "ru_staff" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested inden_card" do
        inden_card = IndenCard.create! valid_attributes
        # Assuming there are no other inden_cards in the database, this
        # specifies that the IndenCard created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        IndenCard.any_instance.should_receive(:update).with({ "ru_staff" => "false" })
        put :update, {:id => inden_card.to_param, :inden_card => { "ru_staff" => "false" }}, valid_session
      end

      it "assigns the requested inden_card as @inden_card" do
        inden_card = IndenCard.create! valid_attributes
        put :update, {:id => inden_card.to_param, :inden_card => valid_attributes}, valid_session
        assigns(:inden_card).should eq(inden_card)
      end

      it "redirects to the inden_card" do
        inden_card = IndenCard.create! valid_attributes
        put :update, {:id => inden_card.to_param, :inden_card => valid_attributes}, valid_session
        response.should redirect_to(inden_card)
      end
    end

    describe "with invalid params" do
      it "assigns the inden_card as @inden_card" do
        inden_card = IndenCard.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        IndenCard.any_instance.stub(:save).and_return(false)
        put :update, {:id => inden_card.to_param, :inden_card => { "ru_staff" => "invalid value" }}, valid_session
        assigns(:inden_card).should eq(inden_card)
      end

      it "re-renders the 'edit' template" do
        inden_card = IndenCard.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        IndenCard.any_instance.stub(:save).and_return(false)
        put :update, {:id => inden_card.to_param, :inden_card => { "ru_staff" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested inden_card" do
      inden_card = IndenCard.create! valid_attributes
      expect {
        delete :destroy, {:id => inden_card.to_param}, valid_session
      }.to change(IndenCard, :count).by(-1)
    end

    it "redirects to the inden_cards list" do
      inden_card = IndenCard.create! valid_attributes
      delete :destroy, {:id => inden_card.to_param}, valid_session
      response.should redirect_to(inden_cards_url)
    end
  end

end