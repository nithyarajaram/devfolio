require 'test_helper'

class AccountControllerTest < ActionController::TestCase
  test "should get my_home" do
    get :my_home
    assert_response :success
  end

end
