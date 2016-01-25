require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get numbtype" do
    get :numbtype
    assert_response :success
  end

  test "should get resulttable" do
    get :resulttable
    assert_response :success
  end

  test "should get passby" do
    get :passby
    assert_response :success
  end

end
