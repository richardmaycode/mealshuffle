require "test_helper"

class LookUpsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get look_ups_new_url
    assert_response :success
  end
end
