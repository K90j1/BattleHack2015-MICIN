class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by_name(params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or user
    else
      flash.now[:danger] = '間違ってるのでもう一度入力してください＞＜'
      render 'new'
    end
	end

	def create_soical
		user = User.from_omniauth(env['omniauth.auth'])
		# session[:user_id] = user.id
		sign_in user
		redirect_back_or user
	end

  def destroy
    sign_out
    redirect_to root_url
	end

	def failure
	end
end