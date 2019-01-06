require 'test_helper'

class CombinationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get combinations_index_url
    assert_response :success
  end

end
