require 'test_helper'

class TokenControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  test "index" do
    c = commanders(:one)
    sign_in commanders(:one)
    get :index
    assert_response :success
  end
end
