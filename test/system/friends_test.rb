require "application_system_test_case"

class FriendsTest < ApplicationSystemTestCase
  setup do
    @friend = friends(:one)
    @member = members(:one)
    @member3 = members(:three)
  end

  test "visiting the index" do
    visit member_friends_path(@member)
    assert_selector "h1", text: "Friends"
  end

  test "creating a Friend" do
    visit member_friends_path(@member)
    click_on "New Friend"

    fill_in "Friend name", with: @member3.name
    click_on "Create Friend"

    assert_text "Friend was successfully created"
    click_on "Back"
  end


  test "destroying a Friend" do
    visit member_friends_path(@member)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Friend was successfully destroyed"
  end
end
