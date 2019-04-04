require 'test_helper'

class RootControllerTest < ActionDispatch::IntegrationTest
  test "should redirect root to members list" do
    get root_url
    assert_redirected_to members_url
  end
end
