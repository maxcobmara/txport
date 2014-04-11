class VehicleNosController < ApplicationController
  before_action :set_vehicle_no, only: [:show, :edit, :update, :destroy]

  # GET /vehicle_nos
  # GET /vehicle_nos.json
  def index
	@vehicle_nos = VehicleNo.order(:end_on => :desc).all
    @search = VehicleNo.search(params[:q])
    @vehicle_nos = @search.result
  end

  # GET /vehicle_nos/1
  # GET /vehicle_nos/1.json
  def show
  end

  # GET /vehicle_nos/new
  def new
    #@vehicle_no = VehicleNo.new
	@vehicle = Vehicle.find(params[:vehicle_id])
    @vehicle_no = @vehicle.vehicle_nos.new(params[:vehicle_no])
    @vehicle_no.save
  end

  # GET /vehicle_nos/1/edit
  def edit
  end

  # POST /vehicle_nos
  # POST /vehicle_nos.json
  def create
    @vehicle_no = VehicleNo.new(vehicle_no_params)

    respond_to do |format|
      if @vehicle_no.save
        format.html { redirect_to @vehicle_no, notice: (t 'vehicle_nos.title')+(t 'actions.created')}
        format.json { render action: 'show', status: :created, location: @vehicle_no }
      else
        format.html { render action: 'new' }
        format.json { render json: @vehicle_no.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicle_nos/1
  # PATCH/PUT /vehicle_nos/1.json
  def update
    respond_to do |format|
      if @vehicle_no.update(vehicle_no_params)
        format.html { redirect_to @vehicle_no, notice: (t 'vehicle_nos.title')+(t 'actions.updated') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vehicle_no.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_nos/1
  # DELETE /vehicle_nos/1.json
  def destroy
    @vehicle_no.destroy
    respond_to do |format|
      format.html { redirect_to vehicle_nos_url, notice: (t 'vehicle_nos.title')+(t 'actions.removed') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_no
      @vehicle_no = VehicleNo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_no_params
      params.require(:vehicle_no).permit(:start_on, :end_on, :vehicle_id, :vehicle_army_id)
    end
end
