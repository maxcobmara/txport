class AcquiredTypesController < ApplicationController
  before_action :set_acquired_type, only: [:show, :edit, :update, :destroy]

  # GET /acquired_types
  # GET /acquired_types.json
  def index
    @acquired_types = AcquiredType.all
    @acquired_type = AcquiredType.new
  end

  # GET /acquired_types/1
  # GET /acquired_types/1.json
  def show
  end

  # GET /acquired_types/new
  def new
    @acquired_type = AcquiredType.new
  end

  # GET /acquired_types/1/edit
  def edit
  end

  # POST /acquired_types
  # POST /acquired_types.json
  def create
    @acquired_type = AcquiredType.new(acquired_type_params)

    respond_to do |format|
      if @acquired_type.save
        format.html { redirect_to @acquired_type, notice: 'Acquired type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @acquired_type }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @acquired_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acquired_types/1
  # PATCH/PUT /acquired_types/1.json
  def update
    respond_to do |format|
      if @acquired_type.update(acquired_type_params)
        format.html { redirect_to @acquired_type, notice: 'Acquired type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @acquired_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acquired_types/1
  # DELETE /acquired_types/1.json
  def destroy
    @acquired_type.destroy
    respond_to do |format|
      format.html { redirect_to acquired_types_url }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acquired_type
      @acquired_type = AcquiredType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acquired_type_params
      params.require(:acquired_type).permit(:short_name, :description)
    end
end
