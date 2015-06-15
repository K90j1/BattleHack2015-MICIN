class TakeoverController < ApplicationController
  ActionController::Parameters.permit_all_parameters = true

  def index
    @proximityUUID = params[:proximityUUID]
    @UUID = params[:UUID]
	end
end
