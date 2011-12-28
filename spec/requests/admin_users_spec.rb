require 'spec_helper'

describe "AdminUsers" do
  describe "Attribut admin" do
    before(:each) do

     @attr = { 
      :name => "Example User",
      :email => "user@example.com",
      :password => "foobar",
      :password_confirmation => "foobar"
    }
      @user = User.create!(@attr)
      # user = User.create!(:id => 2402, :email => "jano@lapin.aaa", :password => "password")
    end

    it "should confirm the existence of admin" do
      #@user.should respond_to(:admin)
    end

    it "should not be a default administrator" do
      #@user.should_not be_admin
    end

    it "should be able to become a administrator" do
      #@user.toggle!(:admin)
      #@user.should be_admin
    end
  end
end

