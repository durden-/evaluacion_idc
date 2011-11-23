require 'spec_helper'

describe PagesController do
  render_views

  before(:each) do
    @base_title = "Evaluacion de los ingenieros de Campo | CNOC "
  end

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end

    it "should have the right title" do
      get 'home'
      response.should have_selector("title", 
                                    :content => @base_title + "| Inicio")
    end
  end

  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
      response.should be_success
    end

    it "should have the right title" do
      get 'contact'
      response.should have_selector("title", 
                                    :content => @base_title + "| Contacto")
    end
  end

  describe "GET 'about'" do
    it "should be successfull" do
      get 'about'
      response.should be_success
    end

    it "should have the right title" do
      get 'about'
      response.should have_selector("title",
                                    :content => @base_title + "| Acerca de...")
    end
  end
end
