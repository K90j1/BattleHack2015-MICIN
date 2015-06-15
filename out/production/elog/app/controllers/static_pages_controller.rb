class StaticPagesController < ApplicationController
  def list
		@logs = Log.all
	end

  def details
		@log = Log.find(params[:id])
  end
end
