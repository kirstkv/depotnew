class ApplicationController < ActionController::Base
  before_filter :authorize
  
  protect_from_forgery
  helper_method :current_user
  
  private

  def current_cart 
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
  end
    
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]  
  end
  
  protected
  
  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to '/sessions/new', :notice => "Please log in"
    end
  end
  
  def check_admin
    user=User.find_by_id(session[:user_id])
    unless user.role_id !=1
      redirect_to( root_url, :notice => "Not authorized user")
    end
  end
  
end
