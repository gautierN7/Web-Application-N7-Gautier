class CommentsController < ApplicationController
  before_filter :authenticate_user! , :except => [:new, :create]

  def new
       @post = Post.find(params[:id])
  end
  
  def create      
      @post = Post.find(params[:id])
      if user_signed_in?  # Utilisateur loggé, on place/fusionne le champ author avec l'adresse email de l'utilisateur
       @comment = @post.comments.create!(params[:comment].merge(:author => current_user.email))
      else  # Pas loggé c'est donc un anonyme
       @comment = @post.comments.create!(params[:comment].merge(:author => "Anonymous"))
      end
      
      redirect_to post_path(@post.id), notice: 'Comment was successfully created'
      rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotUnique#, ActiveRecord::Validation
        redirect_to new_comment_path(@post.id), notice: 'Body can not be blank or Body too long'
  end
  
  def destroy
      @post = Post.find(params[:id])
      @comment = @post.comments.find(params[:idcomment])
      if current_user.email == @comment.author # Utilisateur correct
        @comment.destroy
        redirect_to post_path(@post.id), notice: 'Comment successfuly destroyed'
      else # Utilisateur non loggué / Annoyme
        redirect_to post_path(@post.id), notice: 'Access Denied'
      end
  end
  
  def edit
      @post = Post.find(params[:id])
      @comment = @post.comments.find(params[:idcomment])
      if current_user.email != @comment.author # Utilisateur correct
              redirect_to post_path(@post.id), notice: 'Access Denied'
      end
  end
  
  def update  
    @post = Post.find(params[:id])
    @comment = @post.comments.find(params[:idcomment])
    @comment.update_attributes!(params[:comment])
    #render :text => params.inspect
    redirect_to post_path(@post.id), notice: 'Comment was successfully updated.'
    #if params[:comment][:body].nil?
    rescue ActiveRecord::RecordInvalid, ActiveRecord::RecordNotUnique, ActiveRecord::Validation
           redirect_to edit_comment_path(@post, @comment), notice: 'Body can not be blank, or Title or Body too long'
    #else
    #end
  end
end
