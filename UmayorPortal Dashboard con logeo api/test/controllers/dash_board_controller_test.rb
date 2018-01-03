require 'test_helper'

class DashBoardControllerTest < ActionDispatch::IntegrationTest
  test "should get dash_board" do
    get dash_board_dash_board_url
    assert_response :success
  end

end
