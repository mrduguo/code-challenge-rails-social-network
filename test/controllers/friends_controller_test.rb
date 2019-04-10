require 'test_helper'

class FriendsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friend = friends(:one)
    @member = members(:one)
    @member4 = members(:four)
  end

  test "should get index" do
    get member_friends_path(@member)
    assert_response :success
  end

  test "should get new" do
    get new_member_friend_path(@member)
    assert_response :success
  end

  test "should create friend" do
    assert_difference('Friend.count', 2) do
      post member_friends_path(@member), params: { friend: { friend_name: @member4.name } }
    end

    assert_redirected_to member_friends_path(@member)
  end



  test "should destroy friend" do
    assert_difference('Friend.count', -2) do
      delete member_friend_path(@member, @friend)
    end

    assert_redirected_to member_friends_path(@member)
  end
end
