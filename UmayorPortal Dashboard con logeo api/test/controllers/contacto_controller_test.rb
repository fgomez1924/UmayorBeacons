require 'test_helper'

class ContactoControllerTest < ActionDispatch::IntegrationTest
  test "should get Contacto" do
    get contacto_Contacto_url
    assert_response :success
  end

end
