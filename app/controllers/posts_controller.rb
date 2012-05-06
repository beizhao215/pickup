class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:index, :create, :destroy]

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
  end
end