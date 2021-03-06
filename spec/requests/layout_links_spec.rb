# encoding: utf-8
require 'spec_helper'

describe "Layout links" do

  describe "when not signed in" do
    it "should have a signup link" do
      visit root_path
      response.should have_selector("a", :href => signin_path,
                                         :content => "Iniciar sesión")
    end
  end

  describe "when signed in" do

    before(:each) do
      @user = Factory(:user)
      visit signin_path
      fill_in :email,    :with => @user.email
      fill_in :password, :with => @user.password
      click_button
    end

    it "should have a signout link" do
      visit root_path
      response.should have_selector("a", :href => signout_path,
                                         :content => "Terminar sesión")
    end
  end
end
