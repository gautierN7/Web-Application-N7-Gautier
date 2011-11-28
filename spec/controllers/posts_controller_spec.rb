require 'spec_helper'

describe PostsController do

  describe "POST create" do
    it "should redirect to the post list" do
      post :create
      response.should redirect_to posts_path
    end
  end

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
  
  describe "POST create" do
   before(:each) do
     @new_post_params = {"post" => {"title" => "post_title", "body" => "post_body"}}
     Post.stub(:create) {true}
   end
   it "should create a new Post with the given params" do
     Post.should_receive(:create).with(@new_post_params["post"])
     post :create, @new_post_params
   end

   it "should redirect to posts_path" do
     post :create, @new_post_params
     response.should redirect_to posts_path
   end
  end

end