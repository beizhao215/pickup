class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:index, :create, :edit, :update, :destroy]
  
  before_filter :do_authentication,  only: :destroy
  

 

  def index
   
    @posts = Post.all
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if current_user.admin? && @post.update_attributes(params[:post][:temp_housing_arrangement])
      flash[:success] = "Post updated"
      redirect_to posts_path
    else
      redirect_to root_path
    end
  end
  
  def create
    @user = current_user
    @post = current_user.posts.build(params[:post])
    if @post.save
      flash[:success] = "Post created!"
      redirect_to posts_path
    else
      render 'users/show'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Post deleted!"
    redirect_back_or user_path(current_user)
  end
  
  private
    def do_authentication
      if current_user.admin?
         @post = Post.find_by_id(params[:id])
      else 
         @post = current_user.posts.find_by_id(params[:id])
         redirect_to user_path(current_user) if @post.nil?
      end
    end

end