class ScanController < ApplicationController
	def index
		@proximityUUID = params[:proximityUUID]
		@UUID = params[:UUID]
	end
end
