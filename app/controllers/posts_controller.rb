class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  #before_filter :authorized_user, :only => :destroy
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
	  format.js # new.js.erb
    end
  end
  
  def create
    current_user.posts.create!(params[:post])
    rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotUnique, ActiveRecord::Validation
        respond_to do |format|
            format.html { redirect_to new_post_path, notice: 'Title can not be blank, Body can not be blank, or Title alrealy exists or Title or Body too long' }
            format.json { render json: @post.errors, status: :unprocessable_entity }

        end
    else
        respond_to do |format|
            format.html { redirect_to posts_path, notice: 'Post was successfully created.' } # rake routes pour voir la correspondance #@post = post(@post.id)
            format.json { render json: @post, status: :created, location: @post }
            #format.js
        end    
            #render :text => params.inspect
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def destroy
    post = Post.find(params[:id])
    if current_user.id == post.user_id or current_user.admin
        post.destroy
        redirect_to posts_path, notice: 'Post successfully destroyed'
    else
        redirect_to posts_path, notice: 'Access Denied'
    end
  end
  
  def edit
    @post = Post.find(params[:id])
    if current_user.id == @post.user_id or current_user.admin == true
    else
        redirect_to posts_path, notice: 'Access Deniedaaa'
    end
        
  end
  
  def update
    @post = Post.find(params[:id])
    @post.update_attributes!(params[:post])
    redirect_to post_path(@post), notice: 'Post was successfully updated.'
    rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotUnique, ActiveRecord::Validation
           redirect_to edit_post_path(@post), notice: 'Title can not be blank, Body can not be blank, or Title alrealy exists or Title or Body too long'
  end
  
 #   private  
 #   def authorized_user
 #     #@post = current_user.posts.find_by_id(params[:id])
 #     redirect_to posts_path, notice: 'Access Denied' if current_user.posts.find_by_id(params[:id]).nil?
 #   end
  
end
