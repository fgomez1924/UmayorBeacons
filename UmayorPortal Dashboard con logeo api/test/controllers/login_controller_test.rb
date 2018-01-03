require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  test "should get Login" do
    get login_Login_url
    assert_response :success
  end

end
