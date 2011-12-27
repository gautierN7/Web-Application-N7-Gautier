require 'spec_helper'

describe CommentsController do
  include Devise::TestHelpers
    before(:each) do
      user = Factory.create(:user)
      sign_in user
    end
 #------ Create test ------#
  describe "Comment create" do
	 before(:each) do
         @post = stub_model(Post, :id => 50)
         Post.stub(:find){@post}
         @new_comment_params = {"comment" => {"author" => "aol@aol.com", "body" => "comment_body", "post_id" => "@post.id"}, :id => @post.id}
     end
     it "should create the new comment with the given params with to the post" do
        comments = double(:comments)
        comments.stub(:create){true}
        @post.stub(:comments){comments}
        @post.should_receive(:comments).and_return(comments)
        comments.should_receive(:create!).with(@new_comment_params['comment'])
        post :create, @new_comment_params
     end
     it "should redirect to post_path" do
        post :create, @new_comment_params
        response.should redirect_to post_path(@post.id)
     end
  end

  #------ Delete test ------#
  describe "DELETE comment" do
    before(:each) do
	    user = User.create(:id => 2402, :email => "jano@lapin.aaa", :password => "password")
        sign_in user
        @post = stub_model(Post, :id => 50)
        Post.stub(:find){@post}        
        @comment = stub_model(Comment, :id => 23, :author => user.email)
    end
    it "should search the comment and destroy it then redirect to post with all the comment associated" do
        comments = double(:comments)
        comments.stub(:destroy){true}
        @post.stub(:comments){comments}
        @post.should_receive(:comments).and_return(comments)
        comments.should_receive(:find).with(@comment.id.to_s).and_return(@comment)
        @comment.should_receive(:destroy)
        delete :destroy, {:id => @post.id , :idcomment => @comment.id}
        response.should redirect_to post_path(@post.id)
    end
  end
  
  #------ Edit test ------#
  describe "Comment /edit" do
    before(:each) do						
        @post = stub_model(Post, :id => 50)
        Post.stub(:find){@post}
        @comment = stub_model(Comment, :id => 23)
    end
    it "should get the post from the bd and find the releated comment" do
        comments = double(:comments)
        comments.stub(:find){true}
        @post.stub(:comments){comments}

        # Get the post
        Post.should_receive(:find).with(@post.id.to_s).and_return(@post)
        # Find the comment
        @post.should_receive(:comments).and_return(comments)
        comments.should_receive(:find).with(@comment.id.to_s).and_return(@comment)
        get :edit, {:id => @post.id, :idcomment => @comment.id}
    end
    it "should get the comment from the database" do
    #  Comment.should_receive(:find)
    #  get :edit, {:id => @post.id, :idcomment => @comment.id }
    end
    it "should modify the comment" do
     #   @post.should_receive(:update_attributes)
     #   put :update, {:id => @post.id, :idcomment => @comment.id }
    end
    it "should redirect to the post" do
     #   put :update, {:id => @post.id }
     #   response.should redirect_to post_path(@post.id)
    end    
  end
  
  #------ Index test ------#  
#  describe "GET index" do
#    before(:each) do
#        @post = stub_model(Post, :id => 50)
#        Post.stub(:find){@post}
#        @comments = [stub_model(Comment, :author => "Jackie Chan", :body=>"Commentaire de Jackie", :post_id => @post),
# 					 stub_model(Comment, :author => "Bruce Lee", :body=>"Commentaire de Bruce", :post_id => @post)]
#    end
#    it "should get the post from the bd and find the releated comment" do
#        comments = double(:comments)
#        comments.stub(:find){true}
#        @post.stub(:comments){comments}

        # Get the post
#        Post.should_receive(:find).with(@post.id.to_s).and_return(@post)
#        # Find the comment
#        @post.should_receive(:comments).and_return(comments)
#        comments.should_receive(:find).with(@comments)
#        get :index, :id => @post.id
#    end
#  end
end
