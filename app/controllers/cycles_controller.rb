class CyclesController < ApplicationController
  before_action :set_cycle, only: [:show, :edit, :update, :destroy]

  # GET /cycles
  # GET /cycles.json
  def index
    @cycles = Cycle.all
  end

  # GET /cycles/1
  # GET /cycles/1.json
  def show
  end


    @cycles = Cycle.all
    @hash = Gmaps4rails.build_markers(@cycles) do |cycle, marker|
        marker.lat cycle.latitude
        marker.lng cycle.longitude
    end

  # GET /cycles/new
  def new
    @cycle = Cycle.new
  end

  # GET /cycles/1/edit
  def edit
  end

  # POST /cycles
  # POST /cycles.json
  def create
    @cycle = Cycle.new(cycle_params)

    respond_to do |format|
      if @cycle.save
        format.html { redirect_to @cycle, notice: 'Cycle was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cycle }
      else
        format.html { render action: 'new' }
        format.json { render json: @cycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cycles/1
  # PATCH/PUT /cycles/1.json
  def update
    respond_to do |format|
      if @cycle.update(cycle_params)
        format.html { redirect_to @cycle, notice: 'Cycle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @cycle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cycles/1
  # DELETE /cycles/1.json
  def destroy
    @cycle.destroy
    respond_to do |format|
      format.html { redirect_to cycles_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cycle
      @cycle = Cycle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cycle_params
      params.require(:cycle).permit(:latitude, :longitude, :address)
    end
end
