class VehicleCardsController < ApplicationController
  before_action :set_vehicle_card, only: [:show, :edit, :update, :destroy]

  # GET /vehicle_cards
  # GET /vehicle_cards.json
  def index
    @vehicle_cards = VehicleCard.all
    @search = VehicleCard.search(params[:q])
    @vehicle_cards = @search.result
  end

  # GET /vehicle_cards/1
  # GET /vehicle_cards/1.json
  def show
  end

  # GET /vehicle_cards/new
  def new
    @vehicle_card = VehicleCard.new
  end

  # GET /vehicle_cards/1/edit
  def edit
  end

  # POST /vehicle_cards
  # POST /vehicle_cards.json
  def create
    @vehicle_card = VehicleCard.new(vehicle_card_params)

    respond_to do |format|
      if @vehicle_card.save
        format.html { redirect_to @vehicle_card, notice: (t 'vehicle_cards.title')+(t 'actions.created') }
        format.json { render action: 'show', status: :created, location: @vehicle_card }
      else
        format.html { render action: 'new' }
        format.json { render json: @vehicle_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicle_cards/1
  # PATCH/PUT /vehicle_cards/1.json
  def update
    respond_to do |format|
      if @vehicle_card.update(vehicle_card_params)
        format.html { redirect_to @vehicle_card, notice: (t 'vehicle_cards.title')+(t 'actions.updated') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vehicle_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_cards/1
  # DELETE /vehicle_cards/1.json
  def destroy
    @vehicle_card.destroy
    respond_to do |format|
      format.html { redirect_to vehicle_cards_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_card
      @vehicle_card = VehicleCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_card_params
      params.require(:vehicle_card).permit(:vehicle_id, :serial_no, :staff_id, :unit_id, :issue_date, :start_date, :expired_date, :smart_tag, :smarttag_serial)
    end
end
