class VehicleArmiesController < ApplicationController
  before_action :set_vehicle_army, only: [:show, :edit, :update, :destroy]

  # GET /vehicle_armies
  # GET /vehicle_armies.json
  def index
    #@vehicle_armies = VehicleArmy.all
	@vehicle_armies = VehicleArmy.order(:v_army_no => :desc).all
    @search = VehicleArmy.search(params[:q])
    @vehicle_armies = @search.result
  end

  # GET /vehicle_armies/1
  # GET /vehicle_armies/1.json
  def show
  end

  # GET /vehicle_armies/new
  def new
    @vehicle_army = VehicleArmy.new
  end

  # GET /vehicle_armies/1/edit
  def edit
  end

  # POST /vehicle_armies
  # POST /vehicle_armies.json
  def create
    @vehicle_army = VehicleArmy.new(vehicle_army_params)

    respond_to do |format|
      if @vehicle_army.save
        format.html { redirect_to @vehicle_army, notice: (t 'vehicle_armies.title')+(t 'actions.created')}
        format.json { render action: 'show', status: :created, location: @vehicle_army }
      else
        format.html { render action: 'new' }
        format.json { render json: @vehicle_army.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicle_armies/1
  # PATCH/PUT /vehicle_armies/1.json
  def update
    respond_to do |format|
      if @vehicle_army.update(vehicle_army_params)
        format.html { redirect_to @vehicle_army, notice: (t 'vehicle_armies.title')+(t 'actions.updated') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vehicle_army.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_armies/1
  # DELETE /vehicle_armies/1.json
  def destroy
    @vehicle_army.destroy
    respond_to do |format|
      format.html { redirect_to vehicle_armies_url, notice: (t 'vehicle_armies.title')+(t 'actions.removed') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_army
      @vehicle_army = VehicleArmy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_army_params
      params.require(:vehicle_army).permit(:v_army_no)
    end
end
