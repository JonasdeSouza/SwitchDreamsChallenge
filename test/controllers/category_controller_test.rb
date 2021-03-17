require "test_helper"

class CategoryControllerTest < ActionDispatch::IntegrationTest
  test "should get read" do
    get category_read_url
    assert_response :success
  end
end
