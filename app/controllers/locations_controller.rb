class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
	ActionController::Parameters.permit_all_parameters = true

  # GET /locations
  # GET /locations.json
  def index
  end

  # GET /locations/1
  # GET /locations/1.json
  def show

  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  # POST /locations.json
  def create
		@location = Location.find_by(proximityUUID: params[:proximityUUID])
		if @location
		else
			@location = Location.new(proximityUUID: params[:proximityUUID], UUID: params[:UUID], Trap: params[:Trap])
		end

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render action: 'show', status: :created, location: @location }
      else
        format.html { render action: 'new' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(Location.find_by(proximityUUID: params[:proximityUUID]))
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
			@location = Location.find_by(proximityUUID: params[:proximityUUID])
    end

end
