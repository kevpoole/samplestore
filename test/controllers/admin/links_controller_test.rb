require "test_helper"

class Admin::LinksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_link = admin_links(:one)
  end

  test "should get index" do
    get admin_links_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_link_url
    assert_response :success
  end

  test "should create admin_link" do
    assert_difference("Admin::Link.count") do
      post admin_links_url, params: { admin_link: { name: @admin_link.name, url: @admin_link.url } }
    end

    assert_redirected_to admin_link_url(Admin::Link.last)
  end

  test "should show admin_link" do
    get admin_link_url(@admin_link)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_link_url(@admin_link)
    assert_response :success
  end

  test "should update admin_link" do
    patch admin_link_url(@admin_link), params: { admin_link: { name: @admin_link.name, url: @admin_link.url } }
    assert_redirected_to admin_link_url(@admin_link)
  end

  test "should destroy admin_link" do
    assert_difference("Admin::Link.count", -1) do
      delete admin_link_url(@admin_link)
    end

    assert_redirected_to admin_links_url
  end
end
