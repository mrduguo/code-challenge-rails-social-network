require "application_system_test_case"

class MembersTest < ApplicationSystemTestCase
  setup do
    @member = members(:one)
  end

  test "visiting the index" do
    visit members_url
    assert_selector "h1", text: "Members"
  end

  test "creating a Member" do
    VCR.use_cassette("heading_with_httpbin_org") do
      visit members_url
      click_on "New Member"

      fill_in "Name", with: "#{@member.name}-MembersTest"
      fill_in "Website", with: @member.url_long
      click_on "Create Member"

      assert_text "Member was successfully created"
      click_on "Back"
    end
  end

  test "updating a Member" do
    VCR.use_cassette("heading_with_httpbin_org") do
      visit members_url
      click_on "#{@member.name}"
      click_on "Edit", match: :first

      fill_in "Name", with: "#{@member.name}-MembersTest"
      fill_in "Website", with: @member.url_long
      click_on "Update Member"

      assert_text "Member was successfully updated"
      click_on "Back"
    end
  end

  test "destroying a Member" do
    visit members_url
    click_on "#{@member.name}"
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Member was successfully destroyed"
  end
end
