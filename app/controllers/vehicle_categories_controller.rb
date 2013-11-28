class VehicleCategoriesController < ApplicationController
  before_action :set_vehicle_category, only: [:show, :edit, :update, :destroy]

  # GET /vehicle_categories
  # GET /vehicle_categories.json
  def index
    @vehicle_categories = VehicleCategory.all
	@vehicle_category = VehicleCategory.new
  end

  # GET /vehicle_categories/1
  # GET /vehicle_categories/1.json
  #def show
  #end

  # GET /vehicle_categories/new
  def new
    @vehicle_category = VehicleCategory.new
  end

  # GET /vehicle_categories/1/edit
  def edit
  end

  # POST /vehicle_categories
  # POST /vehicle_categories.json
  def create
    @vehicle_category = VehicleCategory.new(vehicle_category_params)

    respond_to do |format|
      if @vehicle_category.save
        format.html { redirect_to @vehicle_category, notice: 'Vehicle category was successfully created.' }
        format.js
		 format.json { render action: 'show', status: :created, location: @vehicle_category }
      else
        format.html { render action: 'new' }
        format.json { render json: @vehicle_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicle_categories/1
  # PATCH/PUT /vehicle_categories/1.json
  def update
	@vehicle_categories = VehicleCategory.all
	@vehicle_category = VehicleCategory.find(params[:id])
    respond_to do |format|
      if @vehicle_category.update(vehicle_category_params)
        format.html { redirect_to @vehicle_category, notice: 'Vehicle category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vehicle_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicle_categories/1
  # DELETE /vehicle_categories/1.json
  def destroy
    @vehicle_category = VehicleCategory.find(params[:id])
    @vehicle_category.destroy
    respond_to do |format|
      format.html { redirect_to vehicle_categories_url }
	  format.js
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle_category
      @vehicle_category = VehicleCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_category_params
      params.require(:vehicle_category).permit(:short_name, :description)
    end
end
