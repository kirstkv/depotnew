require 'test_helper'

class FaqsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
