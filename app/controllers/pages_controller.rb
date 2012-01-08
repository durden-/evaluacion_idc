class PagesController < ApplicationController

  def home
    @title = "Inicio"
    @evaluation = Evaluation.new if signed_in?
  end

  def contact
    @title = "Contacto"
  end

  def about
    @title = "Acerca de..."
  end
end
