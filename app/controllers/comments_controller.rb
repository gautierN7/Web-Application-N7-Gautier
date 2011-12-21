class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def new
       @post = Post.find(params[:id])
  end
  
  def create
       @post = Post.find(params[:id])
       @comment = @post.comments.create(params[:comment])
       redirect_to post_path(@post.id) 
  end
  
  def destroy
      post = Post.find(params[:id])
      @comment = post.comments.find(params[:idcomment])
      @comment.destroy
      redirect_to post_path(post.id)
  end
  
  def edit
      @post = Post.find(params[:id])
      @comment = @post.comments.find(params[:idcomment])
  end
  
  def update
  
    @post = Post.find(params[:id])
    @comment = @post.comments.find(params[:idcomment])
    @comment.update_attributes(params[:comment])
    redirect_to post_path(@post.id)
  end
end
