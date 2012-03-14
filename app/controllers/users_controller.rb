class UsersController < ApplicationController
  skip_before_filter :authorize
  
  def new  
    @user = User.new
  end  
     
  def create  
    @user = User.new(params[:user])  
    if @user.save  
      redirect_to root_url, :notice => "Signed up!"  
    else  
      render "new"  
    end  
  end
  
  def index
    @users = User.order(:name)
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @users }
    end
  end
  
end
