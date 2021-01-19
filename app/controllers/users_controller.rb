class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create(params.require(:user).permit(:username, :email, :password))

    respond_to do |format|
      if @user.id
        session[:user_id] = @user.id
        format.html { redirect_to '/', notice: 'Usuário criado com sucesso!' }
      else
        format.html { render :new, notice: 'ERRO' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
end
