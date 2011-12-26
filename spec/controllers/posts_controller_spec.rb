require 'spec_helper'

describe PostsController do
  include Devise::TestHelpers
    before(:each) do
      user = Factory.create(:user)
      sign_in user
    end

  #------ Index test ------#
   describe "GET index" do
    before(:each) do
      @posts = [ :p1, :p2, :p3 ]
      Post.stub(:all) { @posts }
    end
    it "should get all the post from the database" do
      Post.should_receive(:all)
      get :index
    end

    it "should assigns the list of posts to @posts" do
      get :index
      assigns(:posts).should == @posts
    end
  end
  
  #------ Create test ------#
  describe "POST create" do
   before(:each) do
     @new_post_params = {"post" => {"title" => "post_title", "body" => "post_body"}}
     @new_post_params2 = {"post" => {"title" => "", "body" => ""}}
     Post.stub(:create) {true}
   end
   it "should create a new Post with the given params" do
     current_user = stub_model(User, :id => 2, :email => "gautier@aol.com", :password => "Azerty")
     posts = double(:posts)
     posts.stub(:create){true}
     current_user.stub(:posts){posts}
     controller.current_user.should_receive(:posts).and_return(posts)  #cf web
     posts.should_receive(:create!).with(@new_post_params["post"])
     post :create, @new_post_params
   end

   it "should redirect to posts_path" do
     post :create, @new_post_params
     response.should redirect_to posts_path
   end
   
    it "should redirect to posts_path" do
     post :create, @new_post_params2
     response.should redirect_to new_post_path
   end
  end  
  

  #------ Delete test ------#
  describe "DELETE destroy" do
    before(:each) do
	  user = User.create(:id => 2402, :email => "jano@lapin.aaa", :password => "password")
      sign_in user
      @post = stub_model(Post, :id => 23, :user_id => user.id)
      @post.stub(:destroy){true}
      Post.stub(:find){@post}
    end
    it "should search the post" do
      Post.should_receive(:find).with(@post.id.to_s).and_return(@post)
      delete :destroy, {:id => @post.id }
    end

    it "should destroy the post" do
      @post.should_receive(:destroy)
      delete :destroy, {:id => @post.id }
    end
    it "should redirect to the posts list" do
      delete :destroy, {:id => @post.id }
      response.should redirect_to posts_path
    end
  end
  
  #------ Show test ------#
  describe "GET show" do
    before(:each) do
      @post = stub_model(Post, :id => 2310, :title => '2310', :body => "2310")
      @post.stub(:show){true}
      Post.stub(:find){@post}
    end
    it "should get the post from the database" do
      Post.should_receive(:find)
      get :show, {:id => @post.id }
    end
    it "should assigns the posts to @post" do
      get :show, {:id => @post.id }
      assigns(:post).should == @post
    end
  end
  
  #------ Edit test ------#
  describe "POST /edit" do
    before(:each) do
      @post = stub_model(Post, :id => 2310, :title => '2310', :body => "2310")
      @post.stub(:edit){true}
      Post.stub(:find){@post}
    end
    it "should get the post from the database" do
      Post.should_receive(:find)
      get :edit, {:id => @post.id }
    end
    it "should modify the post" do
        @post.should_receive(:update_attributes!)
        put :update, {:id => @post.id }
    end
    it "should redirect to the post" do
        put :update, {:id => @post.id }
        response.should redirect_to post_path(@post.id)
    end    
  end
  



  
  
  
  
 
end
