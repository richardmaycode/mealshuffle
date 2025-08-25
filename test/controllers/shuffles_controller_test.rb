require "test_helper"

class ShufflesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shuffles_index_url
    assert_response :success
  end

  test "should get show" do
    get shuffles_show_url
    assert_response :success
  end

  test "should get new" do
    get shuffles_new_url
    assert_response :success
  end
end
