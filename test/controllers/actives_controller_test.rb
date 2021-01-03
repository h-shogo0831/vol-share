require 'test_helper'

class ActivesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get actives_index_url
    assert_response :success
  end

  test "should get show" do
    get actives_show_url
    assert_response :success
  end

  test "should get new" do
    get actives_new_url
    assert_response :success
  end

  test "should get edit" do
    get actives_edit_url
    assert_response :success
  end

end
