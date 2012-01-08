require 'spec_helper'

describe EvaluationsController do
  render_views

  describe "access control" do

    it "should deny access to 'create'" do
      post :create
      response.should redirect_to(signin_path)
    end
  end

  describe "POST 'create'" do

    before(:each) do
      @user = test_sign_in(Factory(:user))
    end

    describe "failure" do

      before(:each) do
        @attr = { :content => "" }
      end

      it "should not create an evaluation" do
        lambda do
          post :create, :evaluation => @attr
        end.should_not change(Evaluation, :count)
      end

      it "should render the home page" do
        post :create, :evaluation => @attr
        response.should render_template('pages/home')
      end
    end

    describe "success" do

      before(:each) do
        @attr = { :incident => "IM1234567",
                  :clarify => "121212-123456",
                  :pregunta_uno => true,
                  :pregunta_dos => true,
                  :pregunta_tres => true,
                  :pregunta_cuatro => true,
                  :notes => "Lorem ipsum" }
      end

      it "should create an evaluation" do
        lambda do
          post :create, :evaluation => @attr
        end.should change(Evaluation, :count).by(1)
      end

      it "should redirect to the home page" do
        post :create, :evaluation => @attr
        response.should redirect_to(root_path)
      end

      it "should have a flash message" do
        post :create, :evaluation => @attr
        flash[:success].should =~ /Gracias por tu ayuda/i
      end
    end
  end
end
