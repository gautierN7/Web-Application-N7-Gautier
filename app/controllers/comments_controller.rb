class CommentsController < ApplicationController
  def new
        @post = Post.find(params[:id])
  end
  
  def create
       @post = Post.find(params[:id])
       @comment = @post.comments.create(params[:comment])
       redirect_to post_path(@post.id) 
  end
  
  

end
