class VehicleFineTypesController < ApplicationController
  before_action :set_vehicle_fine_type, only: [:show, :edit, :update, :destroy]

  # GET /vehicle_fine_types
  # GET /vehicle_fine_types.json
  def index
    @vehicle_fine_types = VehicleFineType.all
  end

  # GET /vehicle_fine_types/1
  # GET /vehicle_fine_types/1.json
  def show
  end

  # GET /vehicle_fine_types/new
  def new
    @vehicle_fine_type = VehicleFineType.new
  end

  # GET /vehicle_fine_types/1/edit
  def edit
  end

  # POST /vehicle_fine_types
  # POST /vehicle_fine_types.json
  def create
    @vehicle_fine_type = VehicleFineType.new(vehicle_fine_type_params)

    respond_to do |format|
      if @vehicle_fine_type.save
        format.html { redirect_to @vehicle_fine_type, notice: 'Vehicle fine type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @vehicle_fine_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @vehicle_fine_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicle_fine_types/1
  # PATCH/PUT /vehicle_fine_types/1.json
  def update
    respond_to do |format|
      if @vehicle_fine_type.update(vehicle_fine_type_params)
        format.html { redirect_to @vehicle_fine_type, notice: 'Vehicle fine type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vehicle_fine_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_fine_types/1
  # DELETE /vehicle_fine_types/1.json
  def destroy
    @vehicle_fine_type.destroy
    respond_to do |format|
      format.html { redirect_to vehicle_fine_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_fine_type
      @vehicle_fine_type = VehicleFineType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_fine_type_params
      params.require(:vehicle_fine_type).permit(:short_name, :description)
    end
end
