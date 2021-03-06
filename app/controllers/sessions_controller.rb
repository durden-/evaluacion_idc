class SessionsController < ApplicationController

  def new
    @title = 'Registro'
  end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Email/password invalido."
      @title = "Registro"
      render 'new'
    else
      sign_in user
      redirect_back_or root_path
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
