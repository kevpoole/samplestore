require "application_system_test_case"

class Admin::LinksTest < ApplicationSystemTestCase
  setup do
    @admin_link = admin_links(:one)
  end

  test "visiting the index" do
    visit admin_links_url
    assert_selector "h1", text: "Links"
  end

  test "should create link" do
    visit admin_links_url
    click_on "New link"

    fill_in "Name", with: @admin_link.name
    fill_in "Url", with: @admin_link.url
    click_on "Create Link"

    assert_text "Link was successfully created"
    click_on "Back"
  end

  test "should update Link" do
    visit admin_link_url(@admin_link)
    click_on "Edit this link", match: :first

    fill_in "Name", with: @admin_link.name
    fill_in "Url", with: @admin_link.url
    click_on "Update Link"

    assert_text "Link was successfully updated"
    click_on "Back"
  end

  test "should destroy Link" do
    visit admin_link_url(@admin_link)
    click_on "Destroy this link", match: :first

    assert_text "Link was successfully destroyed"
  end
end
