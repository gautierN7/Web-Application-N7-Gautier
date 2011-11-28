class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end
  
  def create
    redirect_to posts_path
  end

end
