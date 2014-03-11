class MaintenanceDetailController < ApplicationController
  before_action :set_maintenance_detail, only: [:show, :edit, :update, :destroy]

  # GET /maintenance_details
  # GET /maintenance_details.json
  def index
    @maintenance_details = MaintenanceDetail.all
    @search = MaintenanceDetail.search(params[:q])
    @maintenance_details = @search.result
  end

  # GET /maintenance_details/1
  # GET /maintenance_detailss/1.json
  def show
  end

  # GET /maintenance_details/new
  def new
	  #@vehicle = Vehicle.find(params[:vehicle_id])
	  #@maintenance = @vehicle.maintenances.new(params[:maintenance])
	  #@maintenance.save
  
    @maintenance = Maintenance.find(params[:maintenance_id])
    @maintenance_detail = @maintenance.maintenance_details.new(params[:maintenance_detail])
    @maintenance_detail.save
  end

  # GET /maintenance_details/1/edit
  def edit
  end

  # POST /maintenance_details
  # POST /maintenance_details.json
  def create
    @maintenance_detail = MaintenanceDetail.new(maintenance_detail_params)

    respond_to do |format|
      if @maintenance_detail.save
        format.html { redirect_to @maintenance_detail, notice: (t 'maintenance_details.title')+(t 'actions.created') }
        format.json { render action: 'show', status: :created, location: @maintenance_detail }
      else
        format.html { render action: 'new' }
        format.json { render json: @maintenance_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenance_details/1
  # PATCH/PUT /maintenance_details/1.json
  def update
    respond_to do |format|
      if @maintenance_detail.update(maintenance_detail_params)
        format.html { redirect_to @maintenance_detail, notice: (t 'maintenance_details.title')+(t 'actions.updated') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @maintenance_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenance_details/1
  # DELETE /maintenance_details/1.json
  def destroy
    @maintenance_detail.destroy
    respond_to do |format|
      format.html { redirect_to maintenances_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance_detail
      @maintenance_detail = MaintenanceDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maintenance_detail_params
      params.require(:maintenance_detail).permit(:maintenance_id, :line_item, :line_item_price, :quantity, :unit_type, :maintenance_type_id)
    end
end
