require 'test_helper'

class InformationTypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get information_types_index_url
    assert_response :success
  end

  test "should get show" do
    get information_types_show_url
    assert_response :success
  end

  test "should get new" do
    get information_types_new_url
    assert_response :success
  end

  test "should get edit" do
    get information_types_edit_url
    assert_response :success
  end

  test "should get create" do
    get information_types_create_url
    assert_response :success
  end

  test "should get update" do
    get information_types_update_url
    assert_response :success
  end

  test "should get destroy" do
    get information_types_destroy_url
    assert_response :success
  end

end
