require 'test_helper'

class GreetingsControllerTest < ActionController::TestCase
  test "should get scan" do
    get :scan
    assert_response :success
  end

end
