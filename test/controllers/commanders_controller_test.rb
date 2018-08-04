require 'test_helper'

class CommandersControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  test "show" do
    c = commanders(:one)
    sign_in commanders(:one)
    get :show, params: { id: commanders(:one).id }
    assert_response :success
  end
end
