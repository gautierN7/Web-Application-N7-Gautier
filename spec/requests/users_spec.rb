require 'spec_helper'

describe "Users" do
 
  describe "signup" do
 
    describe "failure" do
      it "should not make a new user" do
        lambda do
          visit new_user_registration_path
          fill_in "user_email",                 :with => ""
          fill_in "user_password",              :with => ""
          fill_in "user_password_confirmation", :with => ""
          click_button("Sign up")
          current_path.should == user_registration_path
          response.should have_selector("div#error_explanation")
        end
      end
    end
 
    describe "success" do
      it "should make a new user" do
        lambda do
          visit new_user_registration_path
          fill_in "user_email",                 :with => "test@123.com"
          fill_in "user_password",              :with => "Azerty"
          fill_in "user_password_confirmation", :with => "Azerty"
          click_button("Sign up")
          response.should have_selector("div .flash", :content => "You have signed up successfully")
          response.should render_template('devise/registrations/new')
        end
      end
    end
 
  end
end
