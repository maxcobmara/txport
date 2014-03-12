class MaintenancesController < ApplicationController
  before_action :set_maintenance, only: [:show, :edit, :update, :destroy]

  # GET /maintenances
  # GET /maintenances.json
  def index
    @maintenances = Maintenance.all
    @search = Maintenance.search(params[:q])
    @maintenances = @search.result
    respond_to do |format|
      format.html
      format.csv { send_data @maintenances.to_csv }
      format.xls #{ send_data @maintenances.to_csv(col_sep: "\t") }
    end
  end

  # GET /maintenances/1
  # GET /maintenances/1.json
  def show
  end

  # GET /maintenances/new
  def new
    #@maintenance = Maintenance.new
	@vehicle = Vehicle.find(params[:vehicle_id])
	@maintenance = @vehicle.maintenances.new(params[:maintenance])
	@maintenance.save
  end

  # GET /maintenances/1/edit
  def edit
  end

  # POST /maintenances
  # POST /maintenances.json
  def create
    @maintenance = Maintenance.new(maintenance_params)

    respond_to do |format|
      if @maintenance.save
        format.html { redirect_to @maintenance, notice: (t 'maintenances.title')+(t 'actions.created') }
        format.json { render action: 'show', status: :created, location: @maintenance }
      else
        format.html { render action: 'new' }
        format.json { render json: @maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maintenances/1
  # PATCH/PUT /maintenances/1.json
  def update
    respond_to do |format|
      if @maintenance.update(maintenance_params)
        format.html { redirect_to @maintenance, notice: (t 'maintenances.title')+(t 'actions.updated') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maintenances/1
  # DELETE /maintenances/1.json
  def destroy
    @maintenance.destroy
    respond_to do |format|
      format.html { redirect_to maintenances_url }
      format.json { head :no_content }
    end
  end

  def maintenance
      @maintenances = Maintenance.all
  end
  
  #-------
  def import_excel
  end
  
  def import
      #use this line or line 88-89
      Maintenance.import(params[:file]) 
      redirect_to maintenances_url, notice: (t 'maintenances.imported') 
      
      #OR use these lines onwards----
      #@maintenances = Maintenance.import(params[:file]) 
      #if @maintenances.all?(&:valid?)
       # @maintenances.each(&:save!)
        #respond_to do |format|
          #flash[:notice] 
          #format.html { redirect_to @maintenances_url, notice: (t 'maintenances.imported') }
          #end
      #else
        #@invalid_maintenances = Vehicle.get_invalid(@maintenances) 
        #respond_to do |format|
          #flash[:notice] = (t 'maintenances.invalid_excel')+@invalid_maintenances.count.to_s+" "+(t 'maintenances.errors_count')  #yellow box
          #format.html { render action: 'import_excel' }
          #flash.discard
          #end
      #end
      #---------
  end
  
  def download_excel_format
    send_file ("#{::Rails.root.to_s}/public/excel_format/maintenance_excel.xls")
  end
  
  #-------
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maintenance
      @maintenance = Maintenance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maintenance_params
      params.require(:maintenance).permit(:vehicle_id, :work_order_no, :contract_id, :repaired_by, :supplied_by, :maintenance_date,maintenance_details_attributes: [:id, :line_item, :line_item_price, :quantity, :unit_type, :maintenance_type_id,:_destroy])
    end
end
