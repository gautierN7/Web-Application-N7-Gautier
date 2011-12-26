class CommentsController < ApplicationController
  before_filter :authenticate_user! , :except => [:new, :create]

  def new
       @post = Post.find(params[:id])
  end
  
  def create
      
      @post = Post.find(params[:id])
      if user_signed_in?    
       @comment = @post.comments.create(params[:comment].merge(:author => current_user.email))
      else
       @comment = @post.comments.create(params[:comment])
      end
      redirect_to post_path(@post.id) 
  end
  
  def destroy
      @post = Post.find(params[:id])
      @comment = @post.comments.find(params[:idcomment])
      @comment.destroy
      redirect_to post_path(@post.id)
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
