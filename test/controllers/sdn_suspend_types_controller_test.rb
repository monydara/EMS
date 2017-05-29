require 'test_helper'

class SdnSuspendTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
