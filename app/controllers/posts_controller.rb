class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_path
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end
end