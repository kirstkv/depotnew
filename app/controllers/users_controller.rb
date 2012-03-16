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
  
  before_filter :check_admin
  def index
    @users = User.order(:username)
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @users }
    end
  end
  
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])

        format.html { redirect_to(users_path, :notice => 'User was successfully updated.') }

        format.html { redirect_to(users_path, :notice => 'Item was successfully updated. '+@user.role_id.to_s)}

        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

    
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(products_url) }
      format.xml  { head :ok }
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end


end
