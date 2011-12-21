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
     @new_comment_params = {"comment" => {"author" => "author", "body" => "comment_body", "post_id" => @post.id}, :id => @post.id}
     Comment.stub(:create){true}
  end
     it "should create the comment with the given params" do
      #  @post.comments.should_receive(:create).with(@new_comment_params["comment"])
      #  post :create, @new_comment_params
     end
     

     it "should redirect to post_path" do
      #  post :create, {:id => @post.id}
      #  response.should redirect_to post_path(@post.id)
     end
  end

  #------ Delete test ------#
  describe "DELETE comment" do
    before(:each) do
      @post = stub_model(Post, :id => 23)
      @comment = stub_model(Comment, :id => 27, :post_id => 23)
      @comment.stub(:destroy){true}
      Comment.stub(:find){@comment}
      Post.stub(:create) {true}
    end
    it "should redirect to the comment list of the post" do
    #  delete :destroy, {:id => @post.id, :post_id => @comment.id }
    #  response.should redirect_to post_path(@post.id)
    end

    it "should search the comment" do
    #  Comment.should_receive(:find).with(@comment.id.to_s).and_return(@comment)
    #  delete :destroy, {:id => @post.id, :post_id => @comment.id }
    end

    it "should destroy the comment" do
    #  @comment.should_receive(:destroy)
    #  delete :destroy, {:id => @post.id, :post_id => @comment.id }
    end
  end
  
  #------ Edit test ------#
  describe "Comment /edit" do
    before(:each) do
    

  ####    @post = stub_model(Post, :id => 23, :title => '2310', :body => "2310")
    @post = Post.create(:title => ";)", :body => ":(", :id => "23")
    Post.stub(:all){ @post }	 				
    @comment = stub_model(Comment, :author => "boby", :body => "boby?", :id => 1, :post_id => @post.id)
	Comment.stub(:find_all_by_post_id) {@post.id}									

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
  


  
  
#  describe "GET index" do
#    before(:each) do
# 		@post = (stub_model(Post, :title => "YATAAAAAAAA", :body=>"Yopida"))
# #     	@comments = [stub_model(Comment, :author => "Jackie Chan", :body=>"Commentaire de Jackie", :post_id => @post),
# 					 stub_model(Comment, :author => "Bruce Lee", :body=>"Commentaire de Bruce", :post_id => @post)]
# 		Comment.stub(:all){ @comments }      
 #    end
 #    it "should get all the comment link to a post from the database" do
 #      Comment.should_receive(:all)
 #      get :index
  #   end
##  
  #  it "should assigns the list of comments to @comments" do
 #      get :index
 # #      assigns(:comments).should == @comments
   # end
 #  end

end
