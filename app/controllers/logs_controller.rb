class LogsController < ApplicationController
	before_action :signed_in_user, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_log, only: [:show, :edit, :update, :destroy]

  # GET /logs
  # GET /logs.json
  def index
		@logs = Log.where(user_id: @current_user)
  end

  # GET /logs/1
  # GET /logs/1.json
  def show
		@log = Log.find(params[:id])
	end

  # GET /logs/new
  def new
    # @log = Log.new
		@user = User.find(params[:user_id])
		@log = @user.log.build
  end

  # GET /logs/1/edit
  def edit
		@log = Log.find(params[:id])
  end

  # POST /logs
  # POST /logs.json
  def create
		@user = User.find(params[:user_id])
		@log = @user.log.build(log_params)
    respond_to do |format|
      if @log.save
        format.html { redirect_to @log}
        flash[:success] = t(:Success)
        format.json { render action: 'show', status: :created, location: @log }
      else
        format.html { render action: 'new' }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logs/1
  # PATCH/PUT /logs/1.json
  def update
    respond_to do |format|
      if @log.update(log_params)
        format.html { redirect_to @log}
        flash[:success] = t(:Success)
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logs/1
  # DELETE /logs/1.json
  def destroy
    @log.destroy
    respond_to do |format|
      format.html { redirect_to user_logs_path(current_user) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = Log.find_by(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def log_params
      params.require(:log).permit(:type, :log, :resolve)
    end
end
