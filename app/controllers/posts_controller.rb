class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:index, :create, :destroy]
  before_filter :correct_user,   only: :destroy

  def index
   
    @posts = Post.all
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
    redirect_back_or user_path(current_user)
  end
  
  private

    def correct_user
      @post = current_user.posts.find_by_id(params[:id])
      redirect_to user_path(current_user) if @post.nil?
    end

end