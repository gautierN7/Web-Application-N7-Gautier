require 'spec_helper'

describe CommentsController do
 #------ Create test ------#
  describe "Comment create" do
	 before(:each) do
        @post = stub_model(Post, :id => 23)
        @new_comment_params = {"comment" => {"author" => "Author", "body" => "Body", "post_id" => @post.id}}
        Post.stub(:create) {true}
     end
     it "should create the comment with the given params" do
        #Comment.should_receive(:create).with(@new_comment_params["comment"])
        #post = Post.find(@post.id).comments.create(@new_comment_params)
        #post :create, @new_comment_params
     end
     

     it "should redirect to post_path" do
        post :create, {:id => @post.id}
        response.should redirect_to post_path(@post.id)
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
