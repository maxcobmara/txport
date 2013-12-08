class VehicleStatusesController < ApplicationController
  before_action :set_vehicle_status, only: [:show, :edit, :update, :destroy]\


  # GET /vehicle_statuses
  # GET /vehicle_statuses.json  
  def index
    @vehicle_statuses = VehicleStatus.all
    @vehicle_status = VehicleStatus.new
  end

  # GET /vehicle_statuses/1
  # GET /vehicle_statuses/1.json
  #def show
  #end

  # GET /vehicle_statuses/new
  def new
    @vehicle_status = VehicleStatus.new
  end

  # GET /vehicle_statuses/1/edit
  def edit
  end

  # POST /vehicle_statuses
  # POST /vehicle_statuses.json
  def create
    @vehicle_status = VehicleStatus.new(vehicle_status_params)

    respond_to do |format|
      if @vehicle_status.save
        format.html { redirect_to vehicle_statuses_url, notice: 'Vehicle status was successfully created.' }
        format.js
        #format.json { render action: 'index', status: :created, location: @vehicle_status }
      else
        format.html { render action: 'index' }
        format.json { render json: @vehicle_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicle_statuses/1
  # PATCH/PUT /vehicle_statuses/1.json
  def update
    @vehicle_statuses = VehicleStatus.all
    @vehicle_status = VehicleStatus.find(params[:id])
    respond_to do |format|
      if @vehicle_status.update(vehicle_status_params)
        format.html { redirect_to vehicle_statuses_url, notice: 'Vehicle status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vehicle_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_statuses/1
  # DELETE /vehicle_statuses/1.json
  def destroy
    @vehicle_status = VehicleStatus.find(params[:id])
    @vehicle_status.destroy
    respond_to do |format|
      format.html { redirect_to vehicle_statuses_url }
      format.js
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_status
      @vehicle_status = VehicleStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_status_params
      params.require(:vehicle_status).permit(:short_name, :description)
    end
end
