class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_filter :correct_user,   only: [:edit, :update]
  before_filter :admin_user,     only: :destroy
  before_filter :volunteer_user, only: :index
  
  def show
      @user = User.find(params[:id])
      @post = current_user.posts.build if signed_in?
      @posts = @user.posts.paginate(page: params[:page])
      @trips = @user.trips
  end
  
  def new
    @user = User.new
  end
  
  def create
      @user = User.new(params[:user])
      if @user.save
        sign_in @user
        flash[:success] = "Signup success! Please complete your info~"
        redirect_to edit_user_path(current_user)
      else
        render 'new'
      end
  end
  
  def edit
  end
  
  def update
   
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def index
    @users = User.all
    sort = params[:sort]
    case sort
      when 'id'
        @users=User.find(:all, :order => "id")
      when 'gender'
        @users=User.find(:all, :order => "gender DESC")
      when 'major'
        @users=User.find(:all, :order => "major")
      when 'newbie'
        @users=User.find(:all, :order => "newbie")
      when 'provide_housing'
        @users=User.find(:all, :order => "provide_housing")
      end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  
  private
    
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
    
    def volunteer_user
      redirect_to(user_path(current_user)) unless !current_user.newbie?
    end
    
    def skip_password_attribute
    if params[:password].blank? && params[:password_confirmation].blank?
      params.except!(:password, :password_confirmation)
    end
  end
end
