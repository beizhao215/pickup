class NewbiesController < ApplicationController
  
  def show
      @newbie = Newbie.find(params[:id])
  end
  
  def new
    @newbie = Newbie.new
  end
  
  def create
      @newbie = Newbie.new(params[:newbie])
      if @newbie.save
        flash[:success] = "Signup success!"
        redirect_to @newbie
      else
        render 'new'
      end
    end
end
