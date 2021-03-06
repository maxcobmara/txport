class DepotFuelsController < ApplicationController
  before_action :set_depot_fuel, only: [:show, :edit, :update, :destroy]

  # GET /depot_fuels
  # GET /depot_fuels.json
  def index
    @depot_fuels = DepotFuel.all
    @search = DepotFuel.search(params[:q])
    @depot_fuels = @search.result
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
  
  def PMP_monthly_usage 
    c = Date.today-8.month
    sdate = c.beginning_of_month
    edate = c.end_of_month
     @month_usage = DepotFuel.where( "issue_date >= ? AND issue_date <= ? ", sdate, edate ) 
     @last_prev_depot_fuel = DepotFuel.where( "issue_date < ? ", sdate).last
  end
  
  def quarter_daily_usage
    sdate = Date.today
    thisyear=sdate.year
    quarter1=Date.new(thisyear, 1, 1)
    quarter2=Date.new(thisyear, 4, 1)
    quarter3=Date.new(thisyear, 7, 1)
    quarter4=Date.new(thisyear, 10,1)
    @last_prev_depot_fuel=DepotFuel.where('issue_date <=?', '2012-09-30').last
    @daily_usage_quarter=DepotFuel.where('issue_date >=? and issue_date <=?', '2012-10-01', '2012-12-31').group_by(&:unit_id)
    @last_prev_depot_fuel1=DepotFuel.where('issue_date <?', quarter1).last
    @last_prev_depot_fuel2=DepotFuel.where('issue_date <?', quarter2).last
    @last_prev_depot_fuel3=DepotFuel.where('issue_date <?', quarter3).last
    @last_prev_depot_fuel4=DepotFuel.where('issue_date <?', quarter4).last
    @daily_usage_quarter1=DepotFuel.where('issue_date >=? and issue_date <?', quarter1, quarter2).group_by(&:unit_id)
    @daily_usage_quarter2=DepotFuel.where('issue_date >=? and issue_date <?', quarter2, quarter3).group_by(&:unit_id) if sdate >= quarter2 
    @daily_usage_quarter3=DepotFuel.where('issue_date >=? and issue_date <?', quarter3, quarter4).group_by(&:unit_id) if sdate >= quarter3 
    @daily_usage_quarter4=DepotFuel.where('issue_date >=? and issue_date <?', quarter4, sdate.end_of_year).group_by(&:unit_id)  if sdate >= quarter4
  end
  def quarter_daily_usage2
    sdate = Date.today
    thisyear=sdate.year
    quarter1=Date.new(thisyear, 1, 1)
    quarter2=Date.new(thisyear, 4, 1)
    quarter3=Date.new(thisyear, 7, 1)
    quarter4=Date.new(thisyear, 10,1)
    @last_prev_depot_fuel1=DepotFuel.where('issue_date <?', quarter1).last
    @last_prev_depot_fuel2=DepotFuel.where('issue_date <?', quarter2).last
    @last_prev_depot_fuel3=DepotFuel.where('issue_date <?', quarter3).last
    @last_prev_depot_fuel4=DepotFuel.where('issue_date <?', quarter4).last
    @daily_usage_quarter1=DepotFuel.where('issue_date >=? and issue_date <?', quarter1, quarter2).group_by(&:unit_id)
    @daily_usage_quarter2=DepotFuel.where('issue_date >=? and issue_date <?', quarter2, quarter3).group_by(&:unit_id) if sdate >= quarter2 
    @daily_usage_quarter3=DepotFuel.where('issue_date >=? and issue_date <?', quarter3, quarter4).group_by(&:unit_id) if sdate >= quarter3 
    @daily_usage_quarter4=DepotFuel.where('issue_date >=? and issue_date <?', quarter4, sdate.end_of_year).group_by(&:unit_id)  if sdate >= quarter4
  end
  
  def import_excel
  end
  
  def import
	a=DepotFuel.import(params[:file]) 		#errorneous : "stc" " tn" " cap" " ftcm"
	if a == "stc"				
		redirect_to import_excel_depot_fuel_url, notice: (t 'depot_fuels.failed')+(t 'depot_fuels.stc')# "stc"
	elsif a == " tn"
		redirect_to import_excel_depot_fuel_url, notice: (t 'depot_fuels.failed')+(t 'depot_fuels.tn')#"tn"
	elsif a == " cap"
		redirect_to import_excel_depot_fuel_url, notice: (t 'depot_fuels.failed')+(t 'depot_fuels.cap')#"cap"
	elsif a == " ftcm"
		redirect_to import_excel_depot_fuel_url, notice: (t 'depot_fuels.failed')+(t 'depot_fuels.ftcm')#"ftcm"
	elsif a == "stc tn"
		redirect_to import_excel_depot_fuel_url, notice: (t 'depot_fuels.failed')+(t 'depot_fuels.stc')+(t 'depot_fuels.tn')#"stc"+"tn"
	elsif a == "stc tn cap"
		redirect_to import_excel_depot_fuel_url, notice: (t 'depot_fuels.failed')+(t 'depot_fuels.stc')+(t 'depot_fuels.tn')+(t 'depot_fuels.cap')#"stc"+"tn"+"cap"
	elsif a == "stc tn cap ftcm"
		redirect_to import_excel_depot_fuel_url, notice: (t 'depot_fuels.failed')+(t 'depot_fuels.stc')+(t 'depot_fuels.tn')+(t 'depot_fuels.cap')+(t 'depot_fuels.ftcm')#"stc"+"tn"+"cap"+"ftcm"
	elsif a == "stc cap"
		redirect_to import_excel_depot_fuel_url, notice: (t 'depot_fuels.failed')+(t 'depot_fuels.stc')+(t 'depot_fuels.cap')# "stc"+"cap"
	elsif a == "stc ftcm"
		redirect_to import_excel_depot_fuel_url, notice: (t 'depot_fuels.failed')+(t 'depot_fuels.stc')+(t 'depot_fuels.ftcm')#"stc"+"ftcm"
	elsif a == "stc cap ftcm"
		redirect_to import_excel_depot_fuel_url, notice: (t 'depot_fuels.failed')+(t 'depot_fuels.stc')+(t 'depot_fuels.cap')+(t 'depot_fuels.ftcm')#"stc"+"cap"+"ftcm"
	elsif a == "tn cap"
		redirect_to import_excel_depot_fuel_url, notice: (t 'depot_fuels.failed')+(t 'depot_fuels.tn')+(t 'depot_fuels.cap')# "tn"+"cap"
	elsif a == "tn ftcm"
		redirect_to import_excel_depot_fuel_url, notice: (t 'depot_fuels.failed')+(t 'depot_fuels.tn')+(t 'depot_fuels.ftcm')#"tn"+"ftcm"
	elsif a == "cap ftcm"
		redirect_to import_excel_depot_fuel_url, notice:  (t 'depot_fuels.failed')+(t 'depot_fuels.cap')+(t 'depot_fuels.ftcm')#"cap"+"ftcm"
	else
      redirect_to depot_fuels_url, notice:(t 'depot_fuels.imported')
    end
  end
  
  def download_excel_format
    send_file ("#{::Rails.root.to_s}/public/excel_format/DepotFuel_Excel.xls")
  end 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_depot_fuel
      @depot_fuel = DepotFuel.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def depot_fuel_params
      params.require(:depot_fuel).permit(:unit_id, :issue_date, fuel_issueds_attributes: [:id, :depot_fuel_id, :fuel_type_id, :quantity, :unit_type_id,:_destroy], fuel_supplieds_attributes: [:id, :depot_fuel_id, :fuel_type_id, :quantity, :unit_type_id,:_destroy], fuel_balances_attributes: [:id, :depot_fuel_id, :fuel_tank_id, :current, :unit_type_id,:_destroy])
    end
end
