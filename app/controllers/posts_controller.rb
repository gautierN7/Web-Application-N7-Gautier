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
    @post = Post.find(params[:id])
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    # if ?
       @post.update_attributes(params[:post])
        redirect_to post_path(@post), notice: 'Post was successfully updated.'
     # else ?
     #   render action: "edit" ?
     # end ?

  end
end
