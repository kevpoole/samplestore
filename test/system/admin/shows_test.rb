require "application_system_test_case"

class Admin::ShowsTest < ApplicationSystemTestCase
  setup do
    @admin_show = admin_shows(:one)
  end

  test "visiting the index" do
    visit admin_shows_url
    assert_selector "h1", text: "Shows"
  end

  test "should create show" do
    visit admin_shows_url
    click_on "New show"

    fill_in "Date", with: @admin_show.date
    fill_in "Description", with: @admin_show.description
    fill_in "Image", with: @admin_show.image
    fill_in "Venue", with: @admin_show.venue
    click_on "Create Show"

    assert_text "Show was successfully created"
    click_on "Back"
  end

  test "should update Show" do
    visit admin_show_url(@admin_show)
    click_on "Edit this show", match: :first

    fill_in "Date", with: @admin_show.date.to_s
    fill_in "Description", with: @admin_show.description
    fill_in "Image", with: @admin_show.image
    fill_in "Venue", with: @admin_show.venue
    click_on "Update Show"

    assert_text "Show was successfully updated"
    click_on "Back"
  end

  test "should destroy Show" do
    visit admin_show_url(@admin_show)
    click_on "Destroy this show", match: :first

    assert_text "Show was successfully destroyed"
  end
end
