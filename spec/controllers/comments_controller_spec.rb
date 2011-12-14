require 'spec_helper'

describe CommentsController do

  describe "Comment create" do
	 before(:each) do
        @post = stub_model(Post, :id => 4)
        Post.stub(:create) {true}
     end
     it "should redirect to post_path" do
        post :create, {:id => @post.id}
        response.should redirect_to post_path(@post.id)
     end
  end

end
