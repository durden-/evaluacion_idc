# == Schema Information
#
# Table name: evaluations
#
#  id              :integer         not null, primary key
#  incident        :string(255)
#  user_id         :integer
#  clarify         :string(255)
#  pregunta_uno    :boolean
#  pregunta_dos    :boolean
#  pregunta_tres   :boolean
#  pregunta_cuatro :boolean
#  notes           :text
#  created_at      :datetime
#  updated_at      :datetime
#
require 'spec_helper'

describe Evaluation do

  before(:each) do
    @user = Factory(:user)
    @attr = { :incident => "IM1234567",
              :clarify => "010512-123456",
              :pregunta_uno => true,
              :pregunta_dos => true,
              :pregunta_tres => false,
              :pregunta_cuatro => false,
              :notes => "value for notes"
    }
  end

  it "should create a new instance given valid attributes" do
    @user.evaluations.create!(@attr)
  end

  describe "user associations" do

    before(:each) do
      @evaluation = @user.evaluations.create(@attr)
    end

    it "should have a user attribute" do
      @evaluation.should respond_to(:user)
    end

    it "should have the right associated user" do
      @evaluation.user_id.should == @user.id
      @evaluation.user.should == @user
    end
  end

  describe "validations" do

    it "should require a user id" do
      Evaluation.new(@attr).should_not be_valid
    end

    it "should require nonblank incident" do
      @user.evaluations.build(:incident => "  ").should_not be_valid
    end

    it "should require nonblank clarify" do
      @user.evaluations.build(:clarify => "  ").should_not be_valid
    end

    it "should reject duplicate clarify" do
      @user.evaluations.create!(@attr)
      @user.evaluations.build(@attr).should_not be_valid
    end

    it "should accept valid incidents" do
      incident = "IM1234567"
      valid_incident = @user.evaluations.build(@attr.merge(:incident => incident))
      valid_incident.should be_valid
    end

    it "should reject invalid incidents" do
      incidents = %w[1234567 1234 im1234567 im1234]
      incidents.each do |incident|
        invalid_incident = @user.evaluations.build(@attr.merge(:incident => incident))
        invalid_incident.should_not be_valid
      end
    end

    it "should accept valid clarify" do
      clarifys = %w[121212-123456 121212-1 121212-12 121212-123 121212-1234 121212-12345]
      clarifys.each do |clarify|
        valid_clarify = @user.evaluations.build(@attr.merge(:clarify => clarify))
        valid_clarify.should be_valid
      end
    end

    it "should reject invalid clarify" do
      clarify = %w[12-12345 1212-123456 1212121234]
      clarify.each do |clarify|
        invalid_clarify = @user.evaluations.build(@attr.merge(:clarify => clarify))
        invalid_clarify.should_not be_valid
      end
    end
  end
end
