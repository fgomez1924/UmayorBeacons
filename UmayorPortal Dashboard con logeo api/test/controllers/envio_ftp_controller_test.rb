require 'test_helper'

class EnvioFtpControllerTest < ActionDispatch::IntegrationTest
  test "should get EnvioFtp" do
    get envio_ftp_EnvioFtp_url
    assert_response :success
  end

end
