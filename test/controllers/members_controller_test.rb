require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member = members(:one)
  end

  test "should get index" do
    get members_url
    assert_response :success
  end

  test "should get new" do
    get new_member_url
    assert_response :success
  end

  test "should create member" do
    VCR.use_cassette("heading_with_httpbin_org") do
      assert_difference('Member.count') do
        post members_url, params: { member: { name: "#{@member.name}-#{Time.now.to_i}", url_long: @member.url_long, url_short: @member.url_short } }
      end

      assert_redirected_to member_url(Member.last)
    end
  end

  test "should show member" do
    get member_url(@member)
    assert_response :success
  end

  test "should get edit" do
    get edit_member_url(@member)
    assert_response :success
  end

  test "should update member" do
    VCR.use_cassette("heading_with_httpbin_org") do
      patch member_url(@member), params: { member: { name: @member.name, url_long: @member.url_long, url_short: @member.url_short } }
      assert_redirected_to member_url(@member)
    end
  end

  test "should destroy member" do
    assert_difference('Member.count', -1) do
      delete member_url(@member)
    end

    assert_redirected_to members_url
  end
end
