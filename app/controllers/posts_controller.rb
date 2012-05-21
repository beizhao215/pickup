class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:index, :create, :destroy]
  
  before_filter :do_authentication,  only: :destroy
  
  before_filter :admin_user,   only: [:edit, :update]
  
  before_filter :volunteer_user, only: :index
  

 

  def index
    @posts=Post.find(:all, :order => "id")
    sort = params[:sort]
    case sort
      when 'id'
        @posts=Post.find(:all, :order => "id")
      when 'arrival_date'
        @posts=Post.find(:all, :order => "arrival_date")
      when 'need_pickup'
        @posts=Post.find(:all, :order => "need_pickup DESC")
      when 'need_housing'
        @posts=Post.find(:all, :order => "need_housing DESC")
      when 'status'
        @posts=Post.find(:all, :order => "status")
      end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
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
      redirect_to user_path(current_user)
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
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
    
    def volunteer_user
      redirect_to(user_path(current_user)) unless !current_user.newbie?
    end

end