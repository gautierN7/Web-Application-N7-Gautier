class PostsController < ApplicationController
  def index
  end

  def new
  end
  
  def create
    redirect_to posts_path
  end

end
