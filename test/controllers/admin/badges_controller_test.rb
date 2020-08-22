require 'test_helper'

class Admin::BadgesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_badges_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_badges_edit_url
    assert_response :success
  end

  test "should get new" do
    get admin_badges_new_url
    assert_response :success
  end

end
