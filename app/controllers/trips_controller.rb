class TripsController < ApplicationController
  before_filter :signed_in_user
  
  def create
    @post = Post.find(params[:trip][:pickedpost_id])
    current_user.pick!(@post)
    @post.toggle!(:status)
    redirect_to user_path(current_user)
  end
  
  def destroy
    @post = Trip.find(params[:id]).pickedpost
    current_user.unpick!(@post)
    @post.status = false
    redirect_to user_path(current_user)
  end
end
    