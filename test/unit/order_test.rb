require 'test_helper'

class OrderTest < ActiveSupport::TestCase


test "requires item in cart" do
  get :new
  assert_redirected_to store_path
  assert_equal flash[:notice], 'Your cart is empty'
end


test "should get new" do
  cart = Cart.create
  session[:cart_id] = cart.id
  LineItem.create(:cart => cart, :product => products(:ruby))
  get :new
  assert_response :success
end


end
