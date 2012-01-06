class UsersController < ApplicationController

  def new
    @user = User.new
    @title = "Formulario de registro"
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Bienvenido!!!!"
      redirect_to @user
    else
      @title = "Formulario de registro"
      render 'new'
    end
  end
end
