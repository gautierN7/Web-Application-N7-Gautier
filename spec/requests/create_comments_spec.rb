require 'spec_helper'

describe "CreateComments" do
    before(:each) do
      @user = User.create!(:email => "gautier@aol.com", :password => "Azerty", :password_confirmation => "Azerty")
      visit new_user_session_path  
      fill_in("user_email", :with => @user.email)  
      fill_in("user_password", :with => @user.password)
      click_button("Sign in")
    end
    describe "GET /posts/id/comments/new" do
        before(:each) do
            @post = Post.create(:title => 'Comment1', :body => "HiHi")
            visit new_comment_path(:id => @post.id)
        end        
        it "current path should /posts/:id/comments/new" do
            current_path.should == new_comment_path(:id => @post.id)
        end    
        it "displays a form to Add a new comment" do
            page.should have_selector("form#new_comment")
        end
        it "should have a author field" do
            page.should have_field("comment[author]")
        end
        it "should have a body field" do
            page.should have_field("comment[body]")
        end
        it "should have a create comment button" do
            page.should have_button("Create Comment")
        end
   end
   describe "use new comment form" do
        before(:each) do
            @post = Post.create(:title => 'Comment1', :body => "HiHi")
            visit new_comment_path(:id => @post.id)
            fill_in("Author", :with => "Comment 1")
            fill_in("Body", :with => "BodyC 1")
            click_button("Create Comment")
        end
        it "should display the comment list" do
            current_path.should == post_path(@post.id)
        end
   end
   describe "after a new post has been created" do
        before(:each) do
              @post = Post.create(:title => 'Comment1', :body => "HiHi")
              visit post_path(@post.id)
              click_button("Create a new Comment")
              current_path.should == new_comment_path(:id => @post.id)
              fill_in("Author", :with => "Comment 1")
              fill_in("Body", :with => "BodyC 1")
              click_button("Create Comment")
              current_path.should == post_path(@post.id)
        end

   end
end
