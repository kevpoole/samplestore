require "application_system_test_case"

class ShowsTest < ApplicationSystemTestCase
  setup do
    @show = shows(:one)
  end

  test "visiting the index" do
    visit shows_url
    assert_selector "h1", text: "Shows"
  end

  test "should create show" do
    visit shows_url
    click_on "New show"

    fill_in "Date", with: @show.date
    fill_in "Description", with: @show.description
    fill_in "Image", with: @show.image
    fill_in "Venue", with: @show.venue
    click_on "Create Show"

    assert_text "Show was successfully created"
    click_on "Back"
  end

  test "should update Show" do
    visit show_url(@show)
    click_on "Edit this show", match: :first

    fill_in "Date", with: @show.date.to_s
    fill_in "Description", with: @show.description
    fill_in "Image", with: @show.image
    fill_in "Venue", with: @show.venue
    click_on "Update Show"

    assert_text "Show was successfully updated"
    click_on "Back"
  end

  test "should destroy Show" do
    visit show_url(@show)
    click_on "Destroy this show", match: :first

    assert_text "Show was successfully destroyed"
  end
end
