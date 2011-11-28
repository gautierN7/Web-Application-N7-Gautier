class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end
  
  def create
    Post.create(params[:post])
    redirect_to posts_path
  end
  
  def show
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

end
