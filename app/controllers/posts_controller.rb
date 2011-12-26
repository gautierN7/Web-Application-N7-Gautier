class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
  end

  def new
  end
  
  def create
    current_user.posts.create!(params[:post])
        redirect_to posts_path, notice: 'Post was successfully created.'
    rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotUnique, ActiveRecord::Validation
      redirect_to new_post_path, notice: 'Title can not be blank, Body can not be blank, or Title alrealy exists or Title or Body too long'


    #render :text => params.inspect
    #respond_to do |format|
    #  if @post.save #Post.find_by_title(params[:post][:title]) #@post.save #current_user.posts.create!(params[:post]) #Post.find_by_title(params[:post][:title])
    #    format.html { redirect_to posts_path, notice: 'Post was successfully created.' } # rake routes pour voir la correspondance #@post = post(@post.id)
    #    format.json { render json: @post, status: :created, location: @post }
    #  else
    #    format.html { redirect_to new_post_path } # 
    #    format.json { render json: @post.errors, status: :unprocessable_entity }
    #  end
    #end
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
       @post.update_attributes!(params[:post])
        redirect_to post_path(@post), notice: 'Post was successfully updated.'
            rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotUnique, ActiveRecord::Validation
      redirect_to edit_post_path(@post), notice: 'Title can not be blank, Body can not be blank, or Title alrealy exists or Title or Body too long'

     # else ?
     #   render action: "edit" ?
     # end ?

  end
  
end
