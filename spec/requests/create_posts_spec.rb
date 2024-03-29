require 'spec_helper'

describe "CreatePosts" do
  before(:each) do
        @user = User.create!(:email => "gautier@aol.com", :password => "Azerty", :password_confirmation => "Azerty")
        visit new_user_session_path  
        fill_in("user_email", :with => @user.email)  
        fill_in("user_password", :with => @user.password)
        click_button("Sign in")
  end
  describe "GET /posts/new" do
    before(:each) do
      visit new_post_path
    end
    it "displays a form to create a new post" do
      page.should have_selector("form#new_post")
    end

    it "should have a title field" do
      page.should have_field("post[title]")
    end
    it "should have a body field" do
      page.should have_field("post[body]")
    end

    it "should have a create post button" do
      page.should have_button("Create Post")
    end
  end

  describe "use new post form" do
    before(:each) do
      visit new_post_path
      fill_in("Title", :with => "Post 1")
      fill_in("Body", :with => "Body 1")
      click_button("Create Post")
    end
    it "should display the post list" do
      current_path.should == posts_path
    end
    
  end

  describe "after a new post has been created" do
    before(:each) do
      visit posts_path
      click_link("Create a new Post")
      current_path.should == new_post_path
      fill_in("Title", :with => "Post 1")
      fill_in("Body", :with => "Body 2?")
      click_button("Create Post")
      current_path.should == posts_path
    end

    it "should display the new post in the list" do
      page.should have_content("Post 1")
      page.should have_content("Body 2?")
    end
  end
      
end
