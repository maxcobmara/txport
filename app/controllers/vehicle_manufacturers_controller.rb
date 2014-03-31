class VehicleManufacturersController < ApplicationController
  before_action :set_vehicle_manufacturer, only: [:show, :edit, :update, :destroy]

  # GET /vehicle_manufacturers
  # GET /vehicle_manufacturers.json
  def index
    @vehicle_manufacturers = VehicleManufacturer.order("name")
    @vehicle_manufacturer = VehicleManufacturer.new
  end

  # GET /vehicle_manufacturers/1
  # GET /vehicle_manufacturers/1.json
  def show
  end

  # GET /vehicle_manufacturers/new
  def new
    @vehicle_manufacturer = VehicleManufacturer.new
  end

  # GET /vehicle_manufacturers/1/edit
  def edit
  end

  # POST /vehicle_manufacturers
  # POST /vehicle_manufacturers.json
  def create
    @vehicle_manufacturer = VehicleManufacturer.new(vehicle_manufacturer_params)

    respond_to do |format|
      if @vehicle_manufacturer.save
        flash.now[:notice] = 'Vehicle manufacturer was successfully created.'
        format.html { redirect_to @vehicle_manufacturer, notice: 'Vehicle manufacturer was successfully created.' }
        format.js
        format.json { render action: 'show', status: :created, location: @vehicle_manufacturer }
      else
        format.html { render action: 'new' }
        format.json { render json: @vehicle_manufacturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicle_manufacturers/1
  # PATCH/PUT /vehicle_manufacturers/1.json
  def update
    respond_to do |format|
      if @vehicle_manufacturer.update(vehicle_manufacturer_params)
        format.html { redirect_to @vehicle_manufacturer, notice: 'Vehicle manufacturer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vehicle_manufacturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_manufacturers/1
  # DELETE /vehicle_manufacturers/1.json
  def destroy
    @vehicle_manufacturer.destroy
    respond_to do |format|
      format.html { redirect_to vehicle_manufacturers_url }
      format.js
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_manufacturer
      @vehicle_manufacturer = VehicleManufacturer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_manufacturer_params
      params.require(:vehicle_manufacturer).permit(:name, :country)
    end
end
