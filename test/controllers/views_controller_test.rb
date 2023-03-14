require "test_helper"

class ViewsControllerTest < ActionDispatch::IntegrationTest
  test "should get starts" do
    get views_starts_url
    assert_response :success
  end
end
