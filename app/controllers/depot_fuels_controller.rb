class DepotFuelsController < ApplicationController
  before_action :set_depot_fuel, only: [:show, :edit, :update, :destroy]

  # GET /depot_fuels
  # GET /depot_fuels.json
  def index
    @depot_fuels = DepotFuel.all
  end

  # GET /depot_fuels/1
  # GET /depot_fuels/1.json
  def show
  end

  # GET /depot_fuels/new
  def new
    @depot_fuel = DepotFuel.new
  end

  # GET /depot_fuels/1/edit
  def edit
  end

  # POST /depot_fuels
  # POST /depot_fuels.json
  def create
    @depot_fuel = DepotFuel.new(depot_fuel_params)

    respond_to do |format|
      if @depot_fuel.save
        format.html { redirect_to @depot_fuel, notice:  (t 'depot_fuels.title')+(t 'actions.created') }
        format.json { render action: 'show', status: :created, location: @depot_fuel }
      else
        format.html { render action: 'new' }
        format.json { render json: @depot_fuel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /depot_fuels/1
  # PATCH/PUT /depot_fuels/1.json
  def update
    respond_to do |format|
      if @depot_fuel.update(depot_fuel_params)
        format.html { redirect_to @depot_fuel, notice:  (t 'depot_fuels.title')+(t 'actions.updated') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @depot_fuel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /depot_fuels/1
  # DELETE /depot_fuels/1.json
  def destroy
    @depot_fuel.destroy
    respond_to do |format|
      format.html { redirect_to depot_fuels_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_depot_fuel
      @depot_fuel = DepotFuel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def depot_fuel_params
      params.require(:depot_fuel).permit(:unit_id, :issue_date, fuel_issueds_attributes: [:id, :depot_fuel_id, :fuel_type_id, :quantity, :unit_type_id], fuel_supplieds_attributes: [:id, :depot_fuel_id, :fuel_type_id, :quantity, :unit_type_id], fuel_balances_attributes: [:id, :depot_fuel_id, :fuel_tank_id, :current, :unit_type_id])
    end
end
