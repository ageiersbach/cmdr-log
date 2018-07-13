require 'test_helper'

class CommandersControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  test "index" do
    sign_in commanders(:one)
    get :index
    assert_response :success
  end

  test "show" do
    c = commanders(:one)
    sign_in commanders(:one)
    get :show, params: { id: commanders(:one).id }
    assert_response :success
  end
end
