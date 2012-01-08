class EvaluationsController < ApplicationController
  before_filter :authenticate, :only => [:create]

  def create
    @evaluation = current_user.evaluations.build(params[:evaluation])
    if @evaluation.save
      flash[:success] = "Gracias por tu ayuda"
      redirect_to root_path
    else
      render 'pages/home'
    end
  end

end
