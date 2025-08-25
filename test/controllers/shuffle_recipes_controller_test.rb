require "test_helper"

class ShuffleRecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get shuffle_recipes_index_url
    assert_response :success
  end

  test "should get show" do
    get shuffle_recipes_show_url
    assert_response :success
  end
end
