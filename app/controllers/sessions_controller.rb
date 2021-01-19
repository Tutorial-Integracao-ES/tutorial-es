class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      # flash.alert = "Usuário ou senha incorreto"
      # redirect_to login_path, alert: "Usuário ou senha incorreto"
      flash[:alert] = 'Usuário ou senha incorreto'
      redirect_to login_path

      # redirect_to login_path
      # flash.now[:notice] = 'Successfully checked in'
    end
  end

  def login
  end

  def destroy # logout
    session[:user_id] = nil
    redirect_to '/'
  end
end
