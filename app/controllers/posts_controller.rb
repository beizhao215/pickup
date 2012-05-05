class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def create
    @user = current_user
    @post = current_user.posts.build(params[:post])
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_path
    else
      render 'users/show'
    end
  end

  def destroy
  end
end