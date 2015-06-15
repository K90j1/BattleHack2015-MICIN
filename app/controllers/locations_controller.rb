class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :create]
	ActionController::Parameters.permit_all_parameters = true

  # GET /locations/1
  # GET /locations/1.json
  def show
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # POST /locations
  # POST /locations.json
  def create
    if params[:result] == 'fault'
      render 'fault'
      return
    end
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


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
			@location = Location.find_by(proximityUUID: params[:proximityUUID])
    end

end
