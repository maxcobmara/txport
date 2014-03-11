class MaintenanceTypesController < ApplicationController
  before_action :set_maintenance_type, only: [:show, :edit, :update, :destroy]

  # GET /maintenance_types
  # GET /maintenance_types.json
  def index
    @maintenance_types = MaintenanceType.all
    @maintenance_type = MaintenanceType.new
  end

  # GET /maintenance_types/1
  # GET /maintenance_types/1.json
  def show
  end

  # GET /maintenance_types/new
  def new
    @maintenance_type = MaintenanceType.new
  end

  # GET /maintenance_types/1/edit
  def edit
  end

  # POST /maintenance_types
  # POST /maintenance_types.json
  def create
    @maintenance_type = MaintenanceType.new(maintenance_type_params)

    respond_to do |format|
      if @maintenance_type.save
        #format.html { redirect_to @maintenance_type, notice: 'Maintenance type was successfully created.' }
        #format.json { render action: 'show', status: :created, location: @maintenance_type }
        #format.js
        format.js
        format.html { redirect_to @maintenance_type, notice: 'Fuel type was successfully created.' }
        
      else
        format.html { render action: 'new' }
        format.json { render json: @maintenance_type.errors, status: :unprocessable_entity }
      end
    end
  end
  
  

  # PATCH/PUT /maintenance_types/1
  # PATCH/PUT /maintenance_types/1.json
  def update
    respond_to do |format|
      if @maintenance_type.update(maintenance_type_params)
        format.html { redirect_to @maintenance_type, notice: 'Maintenance type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @maintenance_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenance_types/1
  # DELETE /maintenance_types/1.json
  def destroy
	@maintenance_type = MaintenanceType.find(params[:id])
    @maintenance_type.destroy
    respond_to do |format|
      format.html { redirect_to maintenance_types_url }
	    format.js
      format.json { head :no_content }
    end
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance_type
      @maintenance_type = MaintenanceType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maintenance_type_params
      params.require(:maintenance_type).permit(:type_name, :description)
    end
end
