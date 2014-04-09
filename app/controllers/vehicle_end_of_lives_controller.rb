class VehicleEndOfLivesController < ApplicationController
  before_action :set_vehicle_end_of_life, only: [:show, :confirm, :update, :destroy]

  # GET /vehicle_end_of_lives
  # GET /vehicle_end_of_lives.json
  def index
    @pending = VehicleEndOfLife.where(confirmed_on: nil).where.not(vehicle_id: nil)
    @confirmed = VehicleEndOfLife.where.not(confirmed_on: nil).where.not(vehicle_id: nil)
    @search =  VehicleEndOfLife.search(params[:q])
    @vehicle_end_of_life = @search.result
    #@vehicle_end_of_lives = VehicleEndOfLife.order(pay_before: :asc).all
    respond_to do |format|
      format.html
      format.csv { send_data @vehicle_end_of_lives.to_csv }
      format.xls { send_data @vehicle_end_of_lives.to_csv(col_sep: "\t") }
  end
end

  # GET /vehicle_end_of_lives/1
  # GET /vehicle_end_of_lives/1.json
  def show
  end

  # GET /vehicle_end_of_lives/new
  def new
    #@vehicle_end_of_life = VehicleEndOfLife.new
	@vehicle = Vehicle.find(params[:vehicle_id])
	@vehicle_end_of_life = @vehicle.vehicle_end_of_lives.new(params[:vehicle_end_of_life])
    @vehicle_end_of_life.save
  end

  # GET /vehicle_end_of_lives/1/edit
  def confirm
  end

  # POST /vehicle_end_of_lives
  # POST /vehicle_end_of_lives.json
  def create
    @vehicle_end_of_life = VehicleEndOfLife.new(vehicle_end_of_life_params)

    respond_to do |format|
      if @vehicle_end_of_life.save
        format.html { redirect_to vehicles_path, notice: (t 'vehicle_end_of_lives.title2')+(t 'actions.created') }
        format.json { render action: 'show', status: :created, location: @vehicle_end_of_life }
      else
        format.html { render action: 'new' }
        format.json { render json: @vehicle_end_of_life.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicle_end_of_lives/1
  # PATCH/PUT /vehicle_end_of_lives/1.json
  def update
    respond_to do |format|
      if @vehicle_end_of_life.update(vehicle_end_of_life_params)
        format.html { redirect_to vehicles_path, notice: (t 'vehicle_end_of_lives.title2')+(t 'actions.updated') }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vehicle_end_of_life.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_end_of_lives/1
  # DELETE /vehicle_end_of_lives/1.json
  def destroy
    @vehicle_end_of_life.destroy
    respond_to do |format|
      format.html { redirect_to vehicle_end_of_lives_url }
      format.json { head :no_content }
    end
  end
  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_end_of_life
      @vehicle_end_of_life = VehicleEndOfLife.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_end_of_life_params
      params.require(:vehicle_end_of_life).permit(:confirmation_code, :confirmed_on, :data, :issued_at, :status, :vehicle_id)
    end
end